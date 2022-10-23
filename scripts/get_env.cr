require "ini"

class GetEnv
  def self.build
    GetEnv.new.build
  end

  @credentials_file : String
  @config_file : String
  @credentials : Hash(String, String) | Nil
  @config : Hash(String, String) | Nil

  def initialize
    @credentials_file = File.join(Path.home, ".aws", "credentials")
    @config_file = File.join(Path.home, ".aws", "config")
  end

  def build : Hash(String, String | Nil)
    env = {
      "CRYSTAL_PATH"          => "#{Crystal::PATH}:..",
      "AWS_PROFILE"           => profile,
      "AWS_ACCESS_KEY_ID"     => access_key_id,
      "AWS_SECRET_ACCESS_KEY" => secret_access_key,
      "AWS_REGION"            => region,
    }
    env["AMAZONITE_DYNAMODB_URL"] = "http://localhost:4566" if local_profile?
    env
  end

  private def access_key_id : String | Nil
    ENV["AWS_ACCESS_KEY_ID"]? || credentials["aws_access_key_id"]?
  end

  private def secret_access_key : String | Nil
    ENV["AWS_SECRET_ACCESS_KEY"]? || credentials["aws_secret_access_key"]?
  end

  private def region : String | Nil
    ENV["AWS_REGION"]? || ENV["AWS_DEFAULT_REGION"]? || config["region"]?
  end

  private def credentials
    return {} of String => String unless credentials_file?
    @credentials.as(Hash(String, String)) unless @credentials.nil?

    ini_file = INI.parse(File.read(@credentials_file))
    credentials = ini_file[profile]?
    credentials.nil? ? {} of String => String : credentials.as(Hash(String, String))
  end

  private def config
    return {} of String => String unless config_file?
    @config.as(Hash(String, String)) unless @config.nil?

    ini_file = INI.parse(File.read(@config_file))
    config_key = ini_file.keys.select { |k| k.includes?(profile) }.first
    return {} of String => String if config_key.nil?
    config = ini_file[config_key]?
    config.nil? ? {} of String => String : config.as(Hash(String, String))
  end

  private def profile
    ARGV.empty? ? "local" : ARGV[0]
  end

  private def local_profile?
    profile == "local"
  end

  private def credentials_file?
    @credentials_file_exists ||= File.exists?(@credentials_file)
  end

  private def config_file?
    @config_file_exists ||= File.exists?(@config_file)
  end
end
