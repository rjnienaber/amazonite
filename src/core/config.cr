module Amazonite::Core
  class Config
    Log = ::Log.for(self)

    abstract class Fetcher
      abstract def []?(key)
    end

    class EnvFetcher < Fetcher
      def []?(key)
        ENV[key]?
      end
    end

    @access_key_id : String
    @secret_access_key : String
    @region : String
    @base_url : String | Nil

    getter access_key_id, secret_access_key, region, base_url

    def initialize(
      access_key_id : String | Nil = nil,
      secret_access_key : String | Nil = nil,
      region : String | Nil = nil,
      @base_url : String | Nil = nil,
      @user_agent : String | Nil = nil,
      @env : Fetcher = EnvFetcher.new
    )
      @access_key_id = if access_key_id
                         Log.debug { |v| "using access_key_id from constructor" }
                         access_key_id
                       elsif @env["AWS_ACCESS_KEY_ID"]?
                         Log.debug { |v| p v; "using access_key_id from 'AWS_ACCESS_KEY_ID' environment variable" }
                         @env["AWS_ACCESS_KEY_ID"]?.as(String)
                       else
                         msg = "no access_key_id provided via constructor or environment variable (AWS_ACCESS_KEY_ID)"
                         Log.error { msg }
                         raise Exception.new(msg)
                       end

      @secret_access_key = if secret_access_key
                             Log.debug { "using secret_access_key from constructor" }
                             secret_access_key
                           elsif @env["AWS_SECRET_ACCESS_KEY"]?
                             Log.debug { "using secret_access_key from 'AWS_SECRET_ACCESS_KEY' environment variable" }
                             @env["AWS_SECRET_ACCESS_KEY"]?.as(String)
                           else
                             msg = "no secret_access_key provided via constructor or environment variable (AWS_SECRET_ACCESS_KEY)"
                             Log.error { msg }
                             raise Exception.new(msg)
                           end

      @region = if region
                  Log.debug { "using region from constructor: #{region}" }
                  region
                elsif @env["AWS_REGION"]?
                  Log.debug { "using region from 'AWS_REGION' environment variable: #{@env["AWS_REGION"]?}" }
                  @env["AWS_REGION"]?.as(String)
                elsif @env["AWS_DEFAULT_REGION"]?
                  Log.debug { "using region from 'AWS_DEFAULT_REGION' environment variable: #{@env["AWS_DEFAULT_REGION"]?}" }
                  @env["AWS_DEFAULT_REGION"]?.as(String)
                else
                  msg = "no region provided via constructor or environment variable (AWS_REGION or AWS_DEFAULT_REGION)"
                  Log.error { msg }
                  raise Exception.new(msg)
                end
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

      url = "#{endpoint_prefix}.#{region}.amazonaws.com"
      Log.trace { "using default base url for endpoint_url: #{url}" }
      url
    end

    def user_agent(&builder) : String
      unless @user_agent.nil?
        Log.debug { "using user_agent from constructor: #{@user_agent}" }
        return @user_agent.as(String)
      end


      if @built_user_agent.nil?
        arch = crystal_description.split.last
        @built_user_agent = [
          "amazonite/#{api_version} Crystal/#{crystal_version}/#{crystal_build_commit}",
          "llvm/#{crystal_llvm_version} arch/#{arch}"
        ].join(" ")
      end

      Log.trace { "using generated user_agent from constructor: #{@built_user_agent}" }
      yield @built_user_agent
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
  end
end
