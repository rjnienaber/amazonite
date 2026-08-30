require "../spec_helper"

private alias IAM = Amazonite::Iam
private alias AC = Amazonite::Core

describe "Iam: basic user operations" do
  user_name = "amazonite-integration-test-user"
  client = IAM::Client.new

  it "removes an existing user" do
    client.delete_user(IAM::DeleteUserRequest.new(user_name))
  rescue IAM::NoSuchEntityException
  end

  it "creates a user" do
    response = client.create_user(IAM::CreateUserRequest.new(user_name))
    response.http.status_code.should eq(200)

    user = response.result.user || raise "expected a user in the response"
    user.user_name.should eq(user_name)
  end

  it "gets the user" do
    response = client.get_user(IAM::GetUserRequest.new(user_name))
    response.http.status_code.should eq(200)

    response.result.user.user_name.should eq(user_name)
  end

  it "lists users" do
    response = client.list_users(IAM::ListUsersRequest.new)
    response.http.status_code.should eq(200)

    names = response.result.users.map(&.user_name)
    names.should contain(user_name)
  end

  it "tags the user" do
    tag_response = client.tag_user(IAM::TagUserRequest.new(user_name, [IAM::Tag.new("Environment", "test")]))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_user_tags(IAM::ListUserTagsRequest.new(user_name))
    list_response.http.status_code.should eq(200)
    tags = list_response.result.tags
    tags.map(&.key).should eq(["Environment"])
    tags.map(&.value).should eq(["test"])

    untag_response = client.untag_user(IAM::UntagUserRequest.new(user_name, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_user_tags(IAM::ListUserTagsRequest.new(user_name))
    list_response.result.tags.should be_empty
  end

  it "deletes the user" do
    response = client.delete_user(IAM::DeleteUserRequest.new(user_name))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(IAM::NoSuchEntityException) do
      client.get_user(IAM::GetUserRequest.new(user_name))
    end
    e.http.should_not be_nil
  end
end
