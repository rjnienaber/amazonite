require "uuid"
require "../spec_helper"

private alias ASM = Amazonite::SecretsManager
private alias AC = Amazonite::Core

describe "SecretsManager: basic secret operations" do
  secret_name = "amazonite-integration-test-secret"
  client = ASM::Client.new
  secret_arn = ""

  it "removes an existing secret" do
    client.describe_secret(ASM::DescribeSecretRequest.new(secret_name))
    delete_response = client.delete_secret(ASM::DeleteSecretRequest.new(secret_name, force_delete_without_recovery: true))
    delete_response.http.status_code.should eq(200)
  rescue ASM::ResourceNotFoundException
  end

  it "creates a secret" do
    request = ASM::CreateSecretRequest.new(
      secret_name,
      client_request_token: UUID.random.to_s,
      secret_string: "s3cr3t",
      description: "amazonite integration test secret",
    )
    response = client.create_secret(request)
    response.http.status_code.should eq(200)

    secret_arn = response.result.arn || raise "expected an ARN in the response"
    secret_arn.should_not be_empty
  end

  it "describes the secret" do
    response = client.describe_secret(ASM::DescribeSecretRequest.new(secret_name))
    response.http.status_code.should eq(200)

    response.result.name.should eq(secret_name)
  end

  it "gets the secret value" do
    response = client.get_secret_value(ASM::GetSecretValueRequest.new(secret_name))
    response.http.status_code.should eq(200)

    response.result.secret_string.should eq("s3cr3t")
  end

  it "puts a new secret value" do
    response = client.put_secret_value(ASM::PutSecretValueRequest.new(secret_name, client_request_token: UUID.random.to_s, secret_string: "n3w-s3cr3t"))
    response.http.status_code.should eq(200)

    get_response = client.get_secret_value(ASM::GetSecretValueRequest.new(secret_name))
    get_response.result.secret_string.should eq("n3w-s3cr3t")
  end

  it "updates the secret" do
    response = client.update_secret(ASM::UpdateSecretRequest.new(secret_name, client_request_token: UUID.random.to_s, description: "updated description"))
    response.http.status_code.should eq(200)

    describe_response = client.describe_secret(ASM::DescribeSecretRequest.new(secret_name))
    describe_response.result.description.should eq("updated description")
  end

  it "tags the secret" do
    tag = ASM::Tag.new("Environment", "test")
    tag_response = client.tag_resource(ASM::TagResourceRequest.new(secret_name, [tag]))
    tag_response.http.status_code.should eq(200)

    describe_response = client.describe_secret(ASM::DescribeSecretRequest.new(secret_name))
    tags = describe_response.result.tags || [] of ASM::Tag
    tags.map(&.key).should eq(["Environment"])
    tags.map(&.value).should eq(["test"])

    untag_response = client.untag_resource(ASM::UntagResourceRequest.new(secret_name, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    describe_response = client.describe_secret(ASM::DescribeSecretRequest.new(secret_name))
    (describe_response.result.tags || [] of ASM::Tag).should be_empty
  end

  it "lists secrets" do
    response = client.list_secrets(ASM::ListSecretsRequest.new)
    response.http.status_code.should eq(200)

    names = (response.result.secret_list || [] of ASM::SecretListEntry).map(&.name)
    names.should contain(secret_name)
  end

  it "deletes the secret" do
    response = client.delete_secret(ASM::DeleteSecretRequest.new(secret_name, force_delete_without_recovery: true))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(ASM::ResourceNotFoundException) do
      client.describe_secret(ASM::DescribeSecretRequest.new(secret_name))
    end
    e.http.should_not be_nil
  end
end
