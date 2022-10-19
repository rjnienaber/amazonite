module Amazonite::Core
  class Config
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
      access_key_id = access_key_id.nil? ? @env["AWS_ACCESS_KEY_ID"]? : access_key_id
      if access_key_id.nil?
        raise Exception.new("no access_key_id provided via constructor or environment variable (AWS_ACCESS_KEY_ID)")
      else
        @access_key_id = access_key_id
      end

      secret_access_key = secret_access_key.nil? ? @env["AWS_SECRET_ACCESS_KEY"]? : secret_access_key
      if secret_access_key.nil?
        raise Exception.new("no secret_access_key provided via constructor or environment variable (AWS_SECRET_ACCESS_KEY)")
      else
        @secret_access_key = secret_access_key
      end

      region = if !region.nil?
                 region
               elsif @env["AWS_REGION"]?
                 @env["AWS_REGION"]?
               elsif @env["AWS_DEFAULT_REGION"]?
                 @env["AWS_DEFAULT_REGION"]?
               end

      if region.nil?
        raise Exception.new("no region provided via constructor or environment variable (AWS_REGION or AWS_DEFAULT_REGION)")
      end

      @region = region
    end

    def endpoint_url(endpoint_prefix) : String
      return @base_url.as(String) unless @base_url.nil?

      env_var_url = @env["AMAZONITE_#{endpoint_prefix.upcase}_URL"]?
      return env_var_url.as(String) unless env_var_url.nil?

      "#{endpoint_prefix}.#{region}.amazonaws.com"
    end

    def user_agent(&builder) : String
      return @user_agent.as(String) unless @user_agent.nil?

      if @built_user_agent.nil?
        arch = crystal_description.split.last
        @built_user_agent = [
          "amazonite/#{api_version} Crystal/#{crystal_version}/#{crystal_build_commit}",
          "llvm/#{crystal_llvm_version} arch/#{arch}"
        ].join(" ")
      end

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
