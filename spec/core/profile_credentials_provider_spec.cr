require "../spec_helper"

private alias ProfileCredentialsProvider = Amazonite::Core::ProfileCredentialsProvider
private alias IniParser = Amazonite::Core::IniParser

describe ProfileCredentialsProvider do
  it "returns credentials for a profile with static keys" do
    parser = MockIniParser.new("other")
    creds = ProfileCredentialsProvider.new(parser).credentials
    creds.should_not be_nil
    creds = creds.as(Amazonite::Core::Credentials)
    creds.access_key_id.should eq("AKIAFOOBARFOOBAR")
    creds.secret_access_key.should eq("fooBAR+foo/BAR")
    creds.session_token.should eq("tokenTOKENtoken")
  end

  it "returns nil for a profile with no static keys" do
    parser = MockIniParser.new("another")
    ProfileCredentialsProvider.new(parser).credentials.should be_nil
  end

  it "returns nil for a profile that does not exist" do
    parser = MockIniParser.new("nonexistent-profile")
    ProfileCredentialsProvider.new(parser).credentials.should be_nil
  end
end
