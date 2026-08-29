require "ini"

module Amazonite::Core
  class IniParser
    Log = ::Log.for(self)

    @credentials_filepath : String?
    @config_filepath : String?
    @access_key_id : String?
    @secret_access_key : String?
    @session_token : String?
    @region : String?

    getter profile, credentials_filepath, config_filepath

    def initialize(
      profile : String? = nil,
      @env : Fetcher = EnvFetcher.new, # TODO: move last
      credentials_filepath : String? = nil,
      config_filepath : String? = nil,
    )
      @profile = if profile
                   Log.debug { "using profile from constructor: #{profile}" }
                   profile
                 elsif @env["AWS_PROFILE"]?
                   Log.debug { "using profile from 'AWS_PROFILE' environment variable: #{@env["AWS_PROFILE"]?}" }
                   @env["AWS_PROFILE"]?.as(String)
                 else
                   Log.debug { "no profile found" }
                 end

      @credentials_filepath = resolve_filepath(credentials_filepath, "credentials")
      @config_filepath = resolve_filepath(config_filepath, "config")
    end

    def [](key)
      case key
      when "access_key_id"     then access_key_id
      when "secret_access_key" then secret_access_key
      when "region"            then region
      else
        raise Exception.new("unknown key for ini file: '#{key}'")
      end
    end

    def access_key_id
      return @access_key_id if @access_key_id
      return if credentials_content.nil? || @profile.nil?
      @access_key_id = credentials_content[@profile.as(String)]?.try &.["aws_access_key_id"]?
    end

    def secret_access_key
      return @secret_access_key if @secret_access_key
      return if credentials_content.nil? || @profile.nil?
      @secret_access_key = credentials_content[@profile.as(String)]?.try &.["aws_secret_access_key"]?
    end

    def session_token
      return @session_token if @session_token
      return if credentials_content.nil? || @profile.nil?
      @session_token = credentials_content[@profile.as(String)]?.try &.["aws_session_token"]?
    end

    def region
      return @region if @region
      @region = config_value("region")
    end

    def role_arn : String?
      config_value("role_arn")
    end

    def source_profile : String?
      config_value("source_profile")
    end

    def sso_start_url : String?
      config_value("sso_start_url")
    end

    def sso_region : String?
      config_value("sso_region")
    end

    def sso_account_id : String?
      config_value("sso_account_id")
    end

    def sso_role_name : String?
      config_value("sso_role_name")
    end

    def sso_session : String?
      config_value("sso_session")
    end

    # looks up a key from a `[sso-session <session_name>]` section, distinct
    # from the `[profile <name>]` sections `#config_value` searches
    def sso_session_config_value(session_name : String, key : String) : String?
      return if config_content.empty?
      section_key = config_content.keys.find { |k| k.includes?("sso-session") && k.includes?(session_name) }
      return if section_key.nil?
      config_content[section_key]?.try &.[key]?
    end

    protected def aws_dir : Path
      Path.home / ".aws"
    end

    private def credentials_content : Hash(String, Hash(String, String))
      @credentials_content ||= read_ini_file(@credentials_filepath) || {} of String => Hash(String, String)
    end

    private def config_content : Hash(String, Hash(String, String))
      @config_content ||= read_ini_file(@config_filepath) || {} of String => Hash(String, String)
    end

    private def config_value(key : String) : String?
      return if config_content.nil? || @profile.nil?
      config_key = config_content.keys.find(&.includes?(profile.as(String)))
      return if config_key.nil?
      config_content[config_key]?.try &.[key]?
    end

    private def read_ini_file(filepath)
      return if filepath.nil?

      INI.parse(File.read(filepath.as(String)))
    end

    private def resolve_filepath(filepath, type)
      if filepath && File.exists?(filepath)
        Log.debug { "using #{type} filepath from constructor: #{filepath}" }
        return filepath
      end

      path = aws_dir / type
      if File.exists?(path)
        Log.debug { "using default #{type} filepath: #{path}" }
        return path.to_s
      end

      Log.debug { "unable to resolve #{type} filepath" }
      nil
    end
  end
end
