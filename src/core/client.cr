require "http/client"
require "awscr-signer"
require "uri"
require "uuid"

module Amazonite::Core
  VERSION = "0.2.1"

  class Client
    Log = ::Log.for(self)

    def initialize(
      @target_prefix : String,
      @endpoint_prefix : String,
      @json_version : String,
      @exception_factory : ResponseExceptionFactory,
      @config = Config.new,
    )
    end

    def post(command, url, body : String)
      id = UUID.random.to_s
      client = create_client(id, command, url, body)
      response = client.post(url, build_headers(command), body)
      process_response(id, command, response)
    end

    # rest-json protocol entry point: unlike #post, the caller has already
    # routed operation members into the method/path/headers/body themselves
    # (rest-json has no fixed X-Amz-Target routing - the method and URI path
    # *are* the routing), so this just signs and dispatches what it's given.
    def rest_request(command : String, method : String, path : String, headers : HTTP::Headers, body : String?)
      id = UUID.random.to_s
      client = create_client(id, command, path, body || "")
      headers["Content-Type"] = "application/json" if body && !headers.has_key?("Content-Type")
      headers["User-Agent"] = @config.user_agent { |agent| "#{agent} command/#{@endpoint_prefix}.#{hyphenate(command)}" }
      response = client.exec(method, path, headers, body)
      process_response(id, command, response)
    end

    # awsQuery protocol entry point: POST / with a form-urlencoded body
    # (Action/Version plus the flattened operation params the caller has
    # already built) and an XML response/error body, unlike #post's JSON.
    def query_request(command : String, body : String)
      id = UUID.random.to_s
      client = create_client(id, command, "/", body)
      headers = HTTP::Headers.new
      headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"
      headers["User-Agent"] = @config.user_agent { |agent| "#{agent} command/#{@endpoint_prefix}.#{hyphenate(command)}" }
      response = client.post("/", headers, body)
      process_response(id, command, response)
    end

    protected def create_client(id, command, url, body)
      endpoint_url = @config.endpoint_url(@endpoint_prefix)
      client = HTTP::Client.new(URI.parse(endpoint_url))
      client.before_request do |request|
        before_request(request)
        key = @config.access_key_id
        secret = @config.secret_access_key
        signer = Awscr::Signer::Signers::V4.new(@endpoint_prefix, @config.region, key, secret)
        signer.sign(request)
        Log.trace do
          "request (#{id}) for operation '#{command}' with method '#{request.method}', url '#{url}', " \
          "headers '#{request.headers.inspect}', body '#{body}'"
        end
      end
      client
    end

    protected def before_request(request)
    end

    protected def process_response(id, command, response)
      success = ((200..299) === response.status_code)
      if success
        Log.trace do
          "response (#{id}) for operation '#{command}', status_code '#{response.status_code}', " \
          "headers '#{response.headers.inspect}', body '#{response.body}'"
        end
      else
        Log.error do
          "response (#{id}) for operation '#{command}', status_code '#{response.status_code}', " \
          "headers '#{response.headers.inspect}', body '#{response.body}'"
        end
      end

      return response if success

      raise @exception_factory.build(response)
    end

    private def base_url(target_prefix) : String
      (@base_url.nil? ? @config.endpoint_url(target_prefix) : @base_url || "").as(String)
    end

    private def build_headers(command)
      user_agent = @config.user_agent { |agent| "#{agent} command/#{@endpoint_prefix}.#{hyphenate(command)}" }
      headers = HTTP::Headers.new
      headers["X-Amz-Target"] = "#{@target_prefix}.#{command}"
      headers["Content-Type"] = "application/x-amz-json-#{@json_version}"
      headers["User-Agent"] = user_agent
      headers
    end

    private def hyphenate(command)
      command.scan(/[A-Z]+[a-z]*/).map(&.[0].downcase).join("-")
    end
  end
end
