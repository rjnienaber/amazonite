require "http/client"

module Amazonite::Core
  class Client
    VERSION = "0.1.1"
    @user_agent : String

    property user_agent

    def initialize(
      @target_prefix : String,
      endpoint_prefix : String,
      @exception_factory : ResponseExceptionFactory | Nil = nil,
      @base_url : String | Nil = nil,
      user_agent : String | Nil = nil,
      @config = Config.new
    )
      if user_agent
        @user_agent = user_agent
        @user_agent_set = true
      else
        # TODO: use Crystal::DESCRIPTION to match aws-cli
        @user_agent = "amazonite/#{VERSION} Crystal/#{Crystal::VERSION} command/#{endpoint_prefix}"
        @user_agent_set = false
      end
    end

    def post(command, url, body : String)
      response = HTTP::Client.post("#{base_url(@target_prefix)}#{url}", build_headers(command), body)
      return response if ((200..299) === response.status_code)

      raise build_error(response)
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

    private def base_url(target_prefix)
      @base_url.nil? ? @config.endpoint_url(target_prefix) : @base_url
    end

    private def build_headers(command)
      hyphenated_command = command.scan(/[A-Z]+[a-z]*/).map { |w| w[0].downcase }.join("-")
      user_agent = @user_agent_set ? @user_agent : "#{@user_agent}.#{hyphenated_command}"
      headers = HTTP::Headers.new
      headers["X-Amz-Target"] = "#{@target_prefix}.#{command}"
      headers["Content-Type"] = "application/x-amz-json-1.0"
      headers["User-Agent"] = user_agent
      headers
    end
  end
end
