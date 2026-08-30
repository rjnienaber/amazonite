module Amazonite::Core
  # Static credentials from `AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY`/
  # `AWS_SESSION_TOKEN` - used by `AssumeRoleCredentialsProvider` to
  # resolve a `source_profile`'s credentials, distinct from `Config`'s own
  # (higher-priority) environment variable check for the primary profile.
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
