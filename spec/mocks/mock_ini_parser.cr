# TODO: should be using interfaces
class MockIniParser < Amazonite::Core::IniParser
  def self.test_credential_filepath
    File.join(Dir.current, "spec", "fixtures", "iniparser", "credentials")
  end

  def self.test_config_filepath
    File.join(Dir.current, "spec", "fixtures", "iniparser", "config")
  end

  protected def aws_dir : Path
    Path.new(Dir.current) / "spec" / "fixtures" / "iniparser"
  end
end
