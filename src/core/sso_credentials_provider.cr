require "http/client"
require "json"
require "uri"
require "digest/sha1"
require "time"
require "./credentials_provider"

module Amazonite::Core
  # SSO cached-token credentials, i.e. the local state `aws sso login` writes
  # - https://docs.aws.amazon.com/sdkref/latest/guide/access-sso.html
  #
  # note the two timestamps involved use different formats: the cache
  # file's expiresAt is ISO-8601, but GetRoleCredentials' expiration is
  # epoch milliseconds
  class SsoCredentialsProvider < CredentialsProvider
    def initialize(@ini_parser : IniParser, @env : Fetcher, @cache_dir : Path = Path.home / ".aws" / "sso" / "cache")
    end

    def credentials : Credentials?
      session_name = @ini_parser.sso_session
      start_url = session_name ? @ini_parser.sso_session_config_value(session_name, "sso_start_url") : @ini_parser.sso_start_url
      sso_region = session_name ? @ini_parser.sso_session_config_value(session_name, "sso_region") : @ini_parser.sso_region
      account_id = @ini_parser.sso_account_id
      role_name = @ini_parser.sso_role_name
      return unless start_url && sso_region && account_id && role_name

      cache_key = Digest::SHA1.hexdigest(session_name || start_url)
      cache_file = @cache_dir / "#{cache_key}.json"
      return unless File.exists?(cache_file)

      token = SsoToken.from_json(File.read(cache_file))
      if token.expiration <= Time.utc
        raise Exception.new("cached SSO token for '#{start_url}' has expired, run 'aws sso login'")
      end

      fetch_role_credentials(sso_region, account_id, role_name, token.access_token)
    end

    private def fetch_role_credentials(sso_region : String, account_id : String, role_name : String, access_token : String) : Credentials
      query = URI::Params.build do |form|
        form.add("account_id", account_id)
        form.add("role_name", role_name)
      end
      client = HTTP::Client.new("portal.sso.#{sso_region}.amazonaws.com", tls: true)
      headers = HTTP::Headers{"x-amz-sso_bearer_token" => access_token, "Accept" => "application/json"}
      response = client.get("/federation/credentials?#{query}", headers)
      unless response.success?
        raise Exception.new("SSO GetRoleCredentials failed with status #{response.status_code}: #{response.body}")
      end

      SsoRoleCredentialsResponse.from_json(response.body).role_credentials.to_credentials
    end
  end

  private class SsoToken
    include JSON::Serializable

    @[JSON::Field(key: "accessToken")]
    getter access_token : String

    @[JSON::Field(key: "expiresAt")]
    getter expires_at : String

    def expiration : Time
      Time.parse_iso8601(@expires_at)
    end
  end

  private class SsoRoleCredentialsResponse
    include JSON::Serializable

    @[JSON::Field(key: "roleCredentials")]
    getter role_credentials : SsoRoleCredentials
  end

  private class SsoRoleCredentials
    include JSON::Serializable

    @[JSON::Field(key: "accessKeyId")]
    getter access_key_id : String

    @[JSON::Field(key: "secretAccessKey")]
    getter secret_access_key : String

    @[JSON::Field(key: "sessionToken")]
    getter session_token : String

    @[JSON::Field(key: "expiration")]
    getter expiration_ms : Int64

    def to_credentials : Credentials
      Credentials.new(access_key_id, secret_access_key, session_token, Time.unix_ms(expiration_ms))
    end
  end
end
