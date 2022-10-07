module Amazonite::Core
  class Client
    VERSION = "0.1.1"

    @user_agent : String

    property user_agent

    def initialize(
      @target_prefix : String,
      endpoint_prefix : String,
      @base_url : String | Nil = nil,
      user_agent : String | Nil = nil
    )
      if user_agent
        @user_agent = user_agent
        @user_agent_set = true
      else
        @user_agent = "amazonite/#{VERSION} Crystal/#{Crystal::VERSION} command/#{endpoint_prefix}"
        @user_agent_set = false
      end
    end

    def post(command, url, body : String)
      HTTP::Client.post("#{@base_url}#{url}", build_headers(command), body)
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

