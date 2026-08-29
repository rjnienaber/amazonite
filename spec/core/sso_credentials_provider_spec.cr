require "../spec_helper"

private alias SsoCredentialsProvider = Amazonite::Core::SsoCredentialsProvider
private alias Credentials = Amazonite::Core::Credentials

private ROLE_CREDENTIALS_RESPONSE = <<-JSON
  {
    "roleCredentials": {
      "accessKeyId": "ASIAEXAMPLE",
      "secretAccessKey": "secretExampleKey",
      "sessionToken": "exampleSessionToken",
      "expiration": 4102444800000
    }
  }
  JSON

private def sso_provider(profile : String, env = MockEnvFetcher.new({} of String => String))
  parser = MockIniParser.new(profile, env)
  SsoCredentialsProvider.new(parser, env, MockIniParser.test_sso_cache_dir)
end

describe SsoCredentialsProvider do
  it "returns nil when the profile has no sso_* keys" do
    sso_provider("other").credentials.should be_nil
  end

  it "returns nil when the cache file for the profile's start url is missing" do
    sso_provider("sso-missing-cache-profile").credentials.should be_nil
  end

  it "fetches role credentials using the legacy sso_start_url cache key" do
    WebMock.stub(:get, "https://portal.sso.us-east-1.amazonaws.com/federation/credentials?account_id=123456789012&role_name=ExampleRole")
      .with(headers: {"x-amz-sso_bearer_token" => "legacy-access-token"})
      .to_return(body: ROLE_CREDENTIALS_RESPONSE)

    creds = sso_provider("sso-legacy-profile").credentials
    creds.should_not be_nil
    creds = creds.as(Credentials)
    creds.access_key_id.should eq("ASIAEXAMPLE")
    creds.secret_access_key.should eq("secretExampleKey")
    creds.session_token.should eq("exampleSessionToken")
    creds.expiration.should eq(Time.unix_ms(4102444800000))
  end

  it "fetches role credentials using the sso_session cache key" do
    WebMock.stub(:get, "https://portal.sso.us-east-1.amazonaws.com/federation/credentials?account_id=123456789012&role_name=ExampleRole")
      .with(headers: {"x-amz-sso_bearer_token" => "session-access-token"})
      .to_return(body: ROLE_CREDENTIALS_RESPONSE)

    creds = sso_provider("sso-session-profile").credentials
    creds.should_not be_nil
  end

  it "raises when the cached token has expired" do
    expect_raises(Exception, "cached SSO token for 'https://expired.awsapps.com/start' has expired") do
      sso_provider("sso-expired-profile").credentials
    end
  end
end
