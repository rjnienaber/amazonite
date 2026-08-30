require "../spec_helper"

private alias STS = Amazonite::Sts
private alias AC = Amazonite::Core

describe "Sts: basic identity and token operations" do
  client = STS::Client.new

  it "gets the caller identity" do
    response = client.get_caller_identity(STS::GetCallerIdentityRequest.new)
    response.http.status_code.should eq(200)

    response.result.account.should_not be_nil
    response.result.arn.should_not be_nil
  end

  it "gets a session token" do
    response = client.get_session_token(STS::GetSessionTokenRequest.new)
    response.http.status_code.should eq(200)

    credentials = response.result.credentials || raise "expected credentials in the response"
    credentials.access_key_id.should_not be_empty
    credentials.secret_access_key.should_not be_empty
    credentials.session_token.should_not be_empty
    credentials.expiration.should be_a(Time)
  end

  it "gets a federation token" do
    request = STS::GetFederationTokenRequest.new("amazonite-integration-test-user")
    response = client.get_federation_token(request)
    response.http.status_code.should eq(200)

    credentials = response.result.credentials || raise "expected credentials in the response"
    credentials.access_key_id.should_not be_empty
    federated_user = response.result.federated_user || raise "expected a federated user in the response"
    federated_user.arn.should_not be_empty
  end

  it "throws an error for an invalid role arn" do
    request = STS::AssumeRoleRequest.new("not-a-valid-role-arn", "amazonite-integration-test-session")
    e = expect_raises(AC::ResponseException) do
      client.assume_role(request)
    end
    e.http.should_not be_nil
    e.message.should_not be_nil
  end
end
