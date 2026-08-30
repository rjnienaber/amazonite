require "uri"
require "xml"
require "./query_response_exception_factory"
require "./credentials_provider"

module Amazonite::Core
  # generic STS query-protocol error handling; the AssumeRole call is
  # hand-rolled here (rather than reusing StsV1::Client) so core/ stays
  # self-contained and doesn't depend on a specific generated service module
  private class AssumeRoleExceptionFactory < QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : ResponseException?
      nil
    end
  end

  # Resolves credentials via STS AssumeRole, using the `role_arn`/
  # `source_profile` chaining configured in `~/.aws/config` for the
  # active profile.
  class AssumeRoleCredentialsProvider < CredentialsProvider
    EXCEPTION_FACTORY = AssumeRoleExceptionFactory.new

    def initialize(@ini_parser : IniParser, @env : Fetcher)
    end

    def credentials : Credentials?
      role_arn = @ini_parser.role_arn
      source_profile = @ini_parser.source_profile
      return unless role_arn && source_profile

      source_creds = resolve_source_credentials(source_profile)
      unless source_creds
        raise Exception.new(
          "profile '#{@ini_parser.profile}' sets role_arn/source_profile, but no static credentials " \
          "could be resolved for source_profile '#{source_profile}'"
        )
      end

      assume_role(role_arn, source_creds)
    end

    private def resolve_source_credentials(source_profile : String) : Credentials?
      source_ini_parser = IniParser.new(source_profile, @env, @ini_parser.credentials_filepath, @ini_parser.config_filepath)
      EnvironmentCredentialsProvider.new(@env).credentials || ProfileCredentialsProvider.new(source_ini_parser).credentials
    end

    private def assume_role(role_arn : String, source_creds : Credentials) : Credentials
      region = @ini_parser.region || @env["AWS_REGION"]? || @env["AWS_DEFAULT_REGION"]? || "us-east-1"
      sts_config = Config.new(source_creds.access_key_id, source_creds.secret_access_key, region, session_token: source_creds.session_token)
      sts_client = Client.new("AWSSecurityTokenServiceV20110615", "sts", "1.0", EXCEPTION_FACTORY, sts_config)

      body = URI::Params.build do |form|
        form.add("Action", "AssumeRole")
        form.add("Version", "2011-06-15")
        form.add("RoleArn", role_arn)
        form.add("RoleSessionName", "amazonite-#{Time.utc.to_unix_ms}")
      end
      response = sts_client.query_request("AssumeRole", body)
      node = XML.parse(response.body).xpath_node("//*[local-name()='Credentials']")
      raise Exception.new("STS AssumeRole for role_arn '#{role_arn}' did not return credentials") if node.nil?

      Credentials.new(
        access_key_id: XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).as(String),
        secret_access_key: XMLValue.string(node.xpath_node("*[local-name()='SecretAccessKey']")).as(String),
        session_token: XMLValue.string(node.xpath_node("*[local-name()='SessionToken']")).as(String),
        expiration: XMLValue.time(node.xpath_node("*[local-name()='Expiration']")).as(Time),
      )
    end
  end
end
