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
      MockIniParser.new.credentials_filepath.as(String).should end_with(File.join("spec", "fixtures", "iniparser", "credentials"))
    end
  end

  describe "#config_filepath" do
    it "uses value from constructor" do
      described_class.new(config_filepath: test_config_filepath).config_filepath.should eq(test_config_filepath)
    end

    it "uses default path if no path provided" do
      MockIniParser.new.config_filepath.as(String).should end_with(File.join("spec", "fixtures", "iniparser", "config"))
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

  describe "#session_token" do
    it "reads session_token from credentials file" do
      token = described_class.new("other", credentials_filepath: test_credential_filepath).session_token
      token.should eq("tokenTOKENtoken")
    end

    it "returns nil if the profile does not have a session_token" do
      token = described_class.new("default", credentials_filepath: test_credential_filepath).session_token
      token.should be_nil
    end
  end

  describe "#role_arn and #source_profile" do
    it "reads role_arn and source_profile from config file" do
      parser = described_class.new("assume-role-profile", config_filepath: test_config_filepath)
      parser.role_arn.should eq("arn:aws:iam::123456789012:role/example-role")
      parser.source_profile.should eq("other")
    end

    it "returns nil if the profile does not set them" do
      parser = described_class.new("other", config_filepath: test_config_filepath)
      parser.role_arn.should be_nil
      parser.source_profile.should be_nil
    end
  end

  describe "#sso_start_url, #sso_region, #sso_account_id, #sso_role_name, #sso_session" do
    it "reads legacy sso_* keys from config file" do
      parser = described_class.new("sso-legacy-profile", config_filepath: test_config_filepath)
      parser.sso_start_url.should eq("https://example.awsapps.com/start")
      parser.sso_region.should eq("us-east-1")
      parser.sso_account_id.should eq("123456789012")
      parser.sso_role_name.should eq("ExampleRole")
      parser.sso_session.should be_nil
    end

    it "reads sso_session from config file" do
      parser = described_class.new("sso-session-profile", config_filepath: test_config_filepath)
      parser.sso_session.should eq("example-sso-session")
      parser.sso_account_id.should eq("123456789012")
      parser.sso_role_name.should eq("ExampleRole")
    end
  end

  describe "#sso_session_config_value" do
    it "reads a key from the matching [sso-session <name>] section" do
      parser = described_class.new("sso-session-profile", config_filepath: test_config_filepath)
      parser.sso_session_config_value("example-sso-session", "sso_start_url").should eq("https://example.awsapps.com/start")
      parser.sso_session_config_value("example-sso-session", "sso_region").should eq("us-east-1")
    end

    it "returns nil if the session does not exist" do
      parser = described_class.new("sso-session-profile", config_filepath: test_config_filepath)
      parser.sso_session_config_value("missing-session", "sso_start_url").should be_nil
    end
  end
end
