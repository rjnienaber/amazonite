require "../spec_helper"

private alias AssumeRoleCredentialsProvider = Amazonite::Core::AssumeRoleCredentialsProvider
private alias Credentials = Amazonite::Core::Credentials

private ASSUME_ROLE_RESPONSE = <<-XML
  <AssumeRoleResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
    <AssumeRoleResult>
      <Credentials>
        <AccessKeyId>ASIAEXAMPLE</AccessKeyId>
        <SecretAccessKey>secretExampleKey</SecretAccessKey>
        <SessionToken>exampleSessionToken</SessionToken>
        <Expiration>2099-01-01T00:00:00Z</Expiration>
      </Credentials>
    </AssumeRoleResult>
  </AssumeRoleResponse>
  XML

describe AssumeRoleCredentialsProvider do
  it "returns nil if the profile has no role_arn/source_profile" do
    parser = MockIniParser.new("other", MockEnvFetcher.new({} of String => String))
    env = MockEnvFetcher.new({} of String => String)
    AssumeRoleCredentialsProvider.new(parser, env).credentials.should be_nil
  end

  it "assumes the role using the source profile's static credentials" do
    WebMock.stub(:post, "https://sts.us-east-1.amazonaws.com/").to_return(body: ASSUME_ROLE_RESPONSE)

    parser = MockIniParser.new("assume-role-profile", MockEnvFetcher.new({} of String => String))
    env = MockEnvFetcher.new({} of String => String)
    creds = AssumeRoleCredentialsProvider.new(parser, env).credentials
    creds.should_not be_nil
    creds = creds.as(Credentials)
    creds.access_key_id.should eq("ASIAEXAMPLE")
    creds.secret_access_key.should eq("secretExampleKey")
    creds.session_token.should eq("exampleSessionToken")
    creds.expiration.should eq(Time.parse_iso8601("2099-01-01T00:00:00Z"))
  end

  it "raises if the source profile has no static credentials" do
    parser = MockIniParser.new("assume-role-missing-source-profile", MockEnvFetcher.new({} of String => String))
    env = MockEnvFetcher.new({} of String => String)
    expect_raises(Exception, "no static credentials could be resolved for source_profile 'another'") do
      AssumeRoleCredentialsProvider.new(parser, env).credentials
    end
  end
end
