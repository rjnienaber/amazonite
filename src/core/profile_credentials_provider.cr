module Amazonite::Core
  # Static credentials from the active profile in `~/.aws/credentials`.
  class ProfileCredentialsProvider < CredentialsProvider
    def initialize(@ini_parser : IniParser)
    end

    def credentials : Credentials?
      key = @ini_parser.access_key_id
      secret = @ini_parser.secret_access_key
      return unless key && secret
      Credentials.new(key, secret, @ini_parser.session_token)
    end
  end
end
