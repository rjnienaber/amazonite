module Amazonite::Core
  class Config
    Log = ::Log.for(self)

    @access_key_id : String
    @secret_access_key : String
    @region : String
    @base_url : String | Nil
    @ini_parser : IniParser

    getter access_key_id, secret_access_key, region, base_url

    def initialize(
      access_key_id : String | Nil = nil,
      secret_access_key : String | Nil = nil,
      region : String | Nil = nil,
      profile : String | Nil = nil,
      @base_url : String | Nil = nil,
      @user_agent : String | Nil = nil,
      @env : Fetcher = EnvFetcher.new
    )
      @ini_parser = create_ini_parser(profile, @env)
      @access_key_id = resolve_config_value("access_key_id", access_key_id, "AWS_ACCESS_KEY_ID")
      @secret_access_key = resolve_config_value("secret_access_key", secret_access_key, "AWS_SECRET_ACCESS_KEY")
      @region = resolve_config_value("region", region, "AWS_REGION", "AWS_DEFAULT_REGION")
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
