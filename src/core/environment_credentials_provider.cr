module Amazonite::Core
  class EnvironmentCredentialsProvider < CredentialsProvider
    def initialize(@env : Fetcher)
    end

    def credentials : Credentials?
      key = @env["AWS_ACCESS_KEY_ID"]?
      secret = @env["AWS_SECRET_ACCESS_KEY"]?
      return unless key && secret
      Credentials.new(key, secret, @env["AWS_SESSION_TOKEN"]?)
    end
  end
end
