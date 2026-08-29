require "../spec_helper"

private alias EnvironmentCredentialsProvider = Amazonite::Core::EnvironmentCredentialsProvider

describe EnvironmentCredentialsProvider do
  it "returns credentials when key and secret are present" do
    env = MockEnvFetcher.new({"AWS_ACCESS_KEY_ID" => "key", "AWS_SECRET_ACCESS_KEY" => "secret"})
    creds = EnvironmentCredentialsProvider.new(env).credentials
    creds.should_not be_nil
    creds = creds.as(Amazonite::Core::Credentials)
    creds.access_key_id.should eq("key")
    creds.secret_access_key.should eq("secret")
    creds.session_token.should be_nil
  end

  it "includes the session token when present" do
    env = MockEnvFetcher.new({
      "AWS_ACCESS_KEY_ID"     => "key",
      "AWS_SECRET_ACCESS_KEY" => "secret",
      "AWS_SESSION_TOKEN"     => "token",
    })
    creds = EnvironmentCredentialsProvider.new(env).credentials
    creds.should_not be_nil
    creds.as(Amazonite::Core::Credentials).session_token.should eq("token")
  end

  it "returns nil if the access key is missing" do
    env = MockEnvFetcher.new({"AWS_SECRET_ACCESS_KEY" => "secret"})
    EnvironmentCredentialsProvider.new(env).credentials.should be_nil
  end

  it "returns nil if the secret key is missing" do
    env = MockEnvFetcher.new({"AWS_ACCESS_KEY_ID" => "key"})
    EnvironmentCredentialsProvider.new(env).credentials.should be_nil
  end
end
