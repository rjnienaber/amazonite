module Amazonite::Core
  class Config
    Log = ::Log.for(self)

    @region : String
    @base_url : String?
    @ini_parser : IniParser
    @credentials : Credentials
    @dynamic : Bool
    @credentials_provider_chain : CredentialsProviderChain?

    getter region, base_url

    def initialize(
      access_key_id : String? = nil,
      secret_access_key : String? = nil,
      region : String? = nil,
      profile : String? = nil,
      @base_url : String? = nil,
      @user_agent : String? = nil,
      @env : Fetcher = EnvFetcher.new,
      session_token : String? = nil,
    )
      @ini_parser = create_ini_parser(profile, @env)
      @region = resolve_config_value("region", region, "AWS_REGION", "AWS_DEFAULT_REGION")

      resolved_key = resolve_access_key_id(access_key_id)
      resolved_secret = resolve_secret_access_key(secret_access_key)

      if resolved_key && resolved_secret
        @dynamic = false
        @credentials = Credentials.new(resolved_key, resolved_secret, resolve_session_token(session_token))
      elsif resolved_key.nil? && resolved_secret.nil?
        @dynamic = true
        chain = build_provider_chain
        @credentials_provider_chain = chain
        @credentials = chain.credentials || raise_no_credentials_error
      else
        @dynamic = false
        raise_partial_credentials_error(resolved_key)
      end
    end

    def access_key_id : String
      current_credentials.access_key_id
    end

    def secret_access_key : String
      current_credentials.secret_access_key
    end

    def session_token : String?
      current_credentials.session_token
    end

    def expiration : Time?
      current_credentials.expiration
    end

    def endpoint_url(endpoint_prefix) : String
      unless @base_url.nil?
        Log.trace { "using base url from constructor for endpoint_url: #{@base_url}" }
        return @base_url.as(String)
      end

      env_var_key = "AMAZONITE_#{endpoint_prefix.upcase}_URL"
      env_var_url = @env[env_var_key]?
      unless env_var_url.nil?
        Log.trace { "using base url from '#{env_var_key}' environment variable for endpoint_url: #{env_var_url}" }
        return env_var_url.as(String)
      end

      url = "https://#{endpoint_prefix}.#{region}.amazonaws.com"
      Log.trace { "using default base url for endpoint_url: #{url}" }
      url
    end

    def user_agent(&) : String
      unless @user_agent.nil?
        Log.debug { "using user_agent from constructor: #{@user_agent}" }
        return @user_agent.as(String)
      end

      if @built_user_agent.nil?
        arch = crystal_description.split.last
        @built_user_agent = [
          "amazonite/#{api_version} Crystal/#{crystal_version}/#{crystal_build_commit}",
          "llvm/#{crystal_llvm_version} arch/#{arch}",
        ].join(" ")
      end

      Log.trace { "using generated user_agent from constructor: #{@built_user_agent}" }
      yield @built_user_agent
    end

    def aws_profile
      @ini_parser.profile
    end

    protected def api_version
      Amazonite::Core::VERSION
    end

    protected def crystal_version
      Crystal::VERSION
    end

    protected def crystal_build_commit
      Crystal::BUILD_COMMIT
    end

    protected def crystal_llvm_version
      Crystal::LLVM_VERSION
    end

    protected def crystal_description
      Crystal::DESCRIPTION
    end

    protected def create_ini_parser(profile, env : Fetcher) : IniParser
      IniParser.new(profile, env)
    end

    protected def build_provider_chain : CredentialsProviderChain
      CredentialsProviderChain.new([
        AssumeRoleCredentialsProvider.new(@ini_parser, @env),
        SsoCredentialsProvider.new(@ini_parser, @env),
        ContainerCredentialsProvider.new(@env),
        InstanceMetadataCredentialsProvider.new(@env),
      ] of CredentialsProvider)
    end

    private def current_credentials : Credentials
      return @credentials unless @dynamic && @credentials.expired?

      if fresh = @credentials_provider_chain.as(CredentialsProviderChain).credentials
        @credentials = fresh
      else
        Log.warn { "failed to refresh expired AWS credentials; continuing with stale credentials" }
      end
      @credentials
    end

    private def resolve_access_key_id(value : String?) : String?
      resolve_optional_value(value, "AWS_ACCESS_KEY_ID") { @ini_parser.access_key_id }
    end

    private def resolve_secret_access_key(value : String?) : String?
      resolve_optional_value(value, "AWS_SECRET_ACCESS_KEY") { @ini_parser.secret_access_key }
    end

    private def resolve_session_token(value : String?) : String?
      resolve_optional_value(value, "AWS_SESSION_TOKEN") { @ini_parser.session_token }
    end

    private def resolve_optional_value(value : String?, env_var_key : String, &) : String?
      return value if value

      env_value = @env[env_var_key]?
      return env_value if env_value

      yield
    end

    # only one of access_key_id/secret_access_key resolving statically is a
    # misconfiguration, not a signal to fall back to the dynamic chain (which
    # would silently discard the one value that *was* found)
    private def raise_partial_credentials_error(resolved_key : String?) : NoReturn
      type, env_var_key = resolved_key.nil? ? {"access_key_id", "AWS_ACCESS_KEY_ID"} : {"secret_access_key", "AWS_SECRET_ACCESS_KEY"}
      msg = "no #{type} provided via constructor or environment variable (#{env_var_key})"
      Log.error { msg }
      raise Exception.new(msg)
    end

    private def raise_no_credentials_error : NoReturn
      msg = "no AWS credentials found for profile '#{aws_profile || "default"}': checked constructor arguments, " \
            "environment variables (AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY), the ini profile in " \
            "'#{@ini_parser.credentials_filepath}'/'#{@ini_parser.config_filepath}', AssumeRole via STS " \
            "(role_arn/source_profile), an SSO cached token, ECS container credentials, and EC2 instance metadata"
      Log.error { msg }
      raise Exception.new(msg)
    end

    private def resolve_config_value(type, value, *env_var_keys)
      if value
        Log.debug { "using #{type} from constructor" }
        return value
      end

      env_var_keys.each do |env_var_key|
        next unless @env[env_var_key]?

        Log.debug { "using #{type} from '#{env_var_key}' environment variable" }
        return @env[env_var_key]?.as(String)
      end

      if @ini_parser[type]
        Log.debug { "using #{type} from profile '#{aws_profile}'" }
        @ini_parser[type].as(String)
      else
        keys = env_var_keys.join(" or ")
        msg = "no #{type} provided via constructor or environment variable (#{keys})"
        Log.error { msg }
        raise Exception.new(msg)
      end
    end
  end
end
