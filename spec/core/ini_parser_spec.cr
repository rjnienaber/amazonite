require "../spec_helper"

private alias IniParser = Amazonite::Core::IniParser

describe IniParser do
  described_class = IniParser
  test_credential_filepath = MockIniParser.test_credential_filepath
  test_config_filepath = MockIniParser.test_config_filepath

  describe "#profile" do
    it "uses value from constructor" do
      IniParser.new("local").profile.should eq("local")
    end

    it "uses 'AWS_PROFILE' environment variable when available" do
      env = MockEnvFetcher.new({"AWS_PROFILE" => "staging"})
      described_class.new(env: env).profile.should eq("staging")
    end

    it "uses value from constructor, even if environment variable specified" do
      env = MockEnvFetcher.new({"AWS_PROFILE" => "staging"})
      described_class.new("local", env).profile.should eq("local")
    end
  end

  describe "#credentials_filepath" do
    it "uses value from constructor" do
      path = described_class.new(credentials_filepath: test_credential_filepath).credentials_filepath
      path.should eq(test_credential_filepath)
    end

    it "uses default path if no path provided" do
      MockIniParser.new.credentials_filepath.as(String).should end_with("/spec/fixtures/iniparser/credentials")
    end
  end

  describe "#config_filepath" do
    it "uses value from constructor" do
      described_class.new(config_filepath: test_config_filepath).config_filepath.should eq(test_config_filepath)
    end

    it "uses default path if no path provided" do
      MockIniParser.new.config_filepath.as(String).should end_with("/spec/fixtures/iniparser/config")
    end
  end

  describe "#access_key_id" do
    it "reads access_key_id from credentials file" do
      key_id = described_class.new("other", credentials_filepath: test_credential_filepath).access_key_id
      key_id.should eq("AKIAFOOBARFOOBAR")
    end

    it "returns nil if the profile does not exist" do
      key_id = described_class.new("gitlab", credentials_filepath: test_credential_filepath).access_key_id
      key_id.should be_nil
    end

    it "returns nil if the profile does not have an access_key_id" do
      key_id = described_class.new("another", credentials_filepath: test_credential_filepath).access_key_id
      key_id.should be_nil
    end

    it "returns nil if the credentials file does not exist" do
      key_id = described_class.new("another", credentials_filepath: "non-existent-file").access_key_id
      key_id.should be_nil
    end
  end

  describe "#secret_access_key" do
    it "reads access_key_id from credentials file" do
      secret_key = described_class.new("other", credentials_filepath: test_credential_filepath).secret_access_key
      secret_key.should eq("fooBAR+foo/BAR")
    end

    it "returns nil if the profile does not exist" do
      secret_key = described_class.new("gitlab", credentials_filepath: test_credential_filepath).secret_access_key
      secret_key.should be_nil
    end

    it "returns nil if the profile does not have an secret_access_key" do
      secret_key = described_class.new("another", credentials_filepath: test_credential_filepath).secret_access_key
      secret_key.should be_nil
    end

    it "returns nil if the credentials file does not exist" do
      secret_key = described_class.new("another", credentials_filepath: "non-existent-file").secret_access_key
      secret_key.should be_nil
    end
  end

  describe "#region" do
    it "reads region from config file" do
      region = described_class.new("other", config_filepath: test_config_filepath).region
      region.should eq("eu-west-2")
    end

    it "returns nil if the profile does not exist" do
      region = described_class.new("gitlab", config_filepath: test_config_filepath).region
      region.should be_nil
    end

    it "returns nil if the profile does not have one" do
      region = described_class.new("another", config_filepath: test_config_filepath).region
      region.should be_nil
    end

    it "returns nil if the config file does not exist" do
      region = described_class.new("another", credentials_filepath: "non-existent-file").region
      region.should be_nil
    end
  end
end
