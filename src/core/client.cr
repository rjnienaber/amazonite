require "http/client"
require "awscr-signer"
require "uri"

module Amazonite::Core
  VERSION = "0.1.1"

  class Client
    def initialize(
      @target_prefix : String,
      @endpoint_prefix : String,
      @exception_factory : ResponseExceptionFactory | Nil = nil,
      @config = Config.new
    )
    end

    def post(command, url, body : String)
      client = create_client(command, url, body)
      response = client.post(url, build_headers(command), body)
      return response if ((200..299) === response.status_code)

      raise build_error(response)
    end

    protected def create_client(command, url, body)
      client = HTTP::Client.new(URI.parse(@config.endpoint_url(@endpoint_prefix)))
      client.before_request do |request|
        region = @config.region
        key = @config.access_key_id
        secret = @config.secret_access_key
        signer = Awscr::Signer::Signers::V4.new(@endpoint_prefix, region, key, secret)
        signer.sign(request)
      end
      client
    end

    private def build_error(response)
      json = JSON::Parser.new(response.body).parse
      exception_type = json["__type"].as_s?
      message = json["message"].as_s
      type = @exception_factory.try &.create_exception(exception_type, response, message)
      type.nil? ? ResponseException.new(response, message) : type
    rescue e : JSON::ParseException
      ResponseException.new(response, response.body)
    end

    private def base_url(target_prefix) : String
      (@base_url.nil? ? @config.endpoint_url(target_prefix) : @base_url || "").as(String)
    end

    private def build_headers(command)
      user_agent = @config.user_agent do |u|
        hyphenated_command = command.scan(/[A-Z]+[a-z]*/).map { |w| w[0].downcase }.join("-")
        "#{u} command/#{@endpoint_prefix}.#{hyphenated_command}"
      end
      headers = HTTP::Headers.new
      headers["X-Amz-Target"] = "#{@target_prefix}.#{command}"
      headers["Content-Type"] = "application/x-amz-json-1.0"
      headers["User-Agent"] = user_agent
      headers
    end
  end
end
