require "../spec_helper"

private alias InstanceMetadataCredentialsProvider = Amazonite::Core::InstanceMetadataCredentialsProvider
private alias Credentials = Amazonite::Core::Credentials

private CREDENTIALS_RESPONSE = <<-JSON
  {
    "AccessKeyId": "ASIAEXAMPLE",
    "SecretAccessKey": "secretExampleKey",
    "Token": "exampleSessionToken",
    "Expiration": "2099-01-01T00:00:00Z"
  }
  JSON

describe InstanceMetadataCredentialsProvider do
  it "returns nil immediately (no HTTP calls) when AWS_EC2_METADATA_DISABLED is true" do
    env = MockEnvFetcher.new({"AWS_EC2_METADATA_DISABLED" => "true"})
    InstanceMetadataCredentialsProvider.new(env).credentials.should be_nil
  end

  it "returns nil, rather than raising, when the metadata endpoint is unreachable" do
    env = MockEnvFetcher.new({} of String => String)
    InstanceMetadataCredentialsProvider.new(env).credentials.should be_nil
  end

  it "fetches credentials via the full IMDSv2 token -> role name -> credentials sequence" do
    WebMock.stub(:put, "http://169.254.169.254/latest/api/token")
      .with(headers: {"X-aws-ec2-metadata-token-ttl-seconds" => "21600"})
      .to_return(body: "a-token")
    WebMock.stub(:get, "http://169.254.169.254/latest/meta-data/iam/security-credentials/")
      .with(headers: {"X-aws-ec2-metadata-token" => "a-token"})
      .to_return(body: "example-role")
    WebMock.stub(:get, "http://169.254.169.254/latest/meta-data/iam/security-credentials/example-role")
      .with(headers: {"X-aws-ec2-metadata-token" => "a-token"})
      .to_return(body: CREDENTIALS_RESPONSE)

    env = MockEnvFetcher.new({} of String => String)
    creds = InstanceMetadataCredentialsProvider.new(env).credentials
    creds.should_not be_nil
    creds = creds.as(Credentials)
    creds.access_key_id.should eq("ASIAEXAMPLE")
    creds.secret_access_key.should eq("secretExampleKey")
    creds.session_token.should eq("exampleSessionToken")
  end
end
