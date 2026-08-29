require "../spec_helper"

private alias ContainerCredentialsProvider = Amazonite::Core::ContainerCredentialsProvider
private alias Credentials = Amazonite::Core::Credentials

private CREDENTIALS_RESPONSE = <<-JSON
  {
    "AccessKeyId": "ASIAEXAMPLE",
    "SecretAccessKey": "secretExampleKey",
    "Token": "exampleSessionToken",
    "Expiration": "2099-01-01T00:00:00Z"
  }
  JSON

describe ContainerCredentialsProvider do
  it "returns nil when neither container credentials env var is set" do
    env = MockEnvFetcher.new({} of String => String)
    ContainerCredentialsProvider.new(env).credentials.should be_nil
  end

  it "fetches credentials from the relative URI on the ECS metadata host" do
    WebMock.stub(:get, "http://169.254.170.2/v2/creds").to_return(body: CREDENTIALS_RESPONSE)

    env = MockEnvFetcher.new({"AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/v2/creds"})
    creds = ContainerCredentialsProvider.new(env).credentials
    creds.should_not be_nil
    creds = creds.as(Credentials)
    creds.access_key_id.should eq("ASIAEXAMPLE")
    creds.secret_access_key.should eq("secretExampleKey")
    creds.session_token.should eq("exampleSessionToken")
  end

  it "fetches credentials from the full URI with an authorization token" do
    WebMock.stub(:get, "http://localhost:9000/creds")
      .with(headers: {"Authorization" => "a-token"})
      .to_return(body: CREDENTIALS_RESPONSE)

    env = MockEnvFetcher.new({
      "AWS_CONTAINER_CREDENTIALS_FULL_URI" => "http://localhost:9000/creds",
      "AWS_CONTAINER_AUTHORIZATION_TOKEN"  => "a-token",
    })
    creds = ContainerCredentialsProvider.new(env).credentials
    creds.should_not be_nil
  end

  it "raises when the endpoint returns a non-2xx status" do
    WebMock.stub(:get, "http://169.254.170.2/v2/creds-error").to_return(status: 500)

    env = MockEnvFetcher.new({"AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/v2/creds-error"})
    expect_raises(Exception, "ECS container credentials endpoint returned status 500") do
      ContainerCredentialsProvider.new(env).credentials
    end
  end
end
