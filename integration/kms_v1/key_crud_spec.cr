require "base64"
require "../spec_helper"

private alias KMS = Amazonite::KmsV1
private alias AC = Amazonite::Core

describe "KmsV1: basic key operations" do
  client = KMS::Client.new
  key_id = ""

  it "creates a key" do
    request = KMS::CreateKeyRequest.new(description: "amazonite integration test key")
    response = client.create_key(request)
    response.http.status_code.should eq(200)

    key_id = response.result.key_metadata.try(&.key_id) || raise "expected key metadata in the response"
    key_id.should_not be_empty
  end

  it "describes the key" do
    response = client.describe_key(KMS::DescribeKeyRequest.new(key_id))
    response.http.status_code.should eq(200)

    response.result.key_metadata.try(&.key_id).should eq(key_id)
  end

  it "tags the key" do
    tag = KMS::Tag.new("Environment", "test")
    tag_response = client.tag_resource(KMS::TagResourceRequest.new(key_id, [tag]))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_resource_tags(KMS::ListResourceTagsRequest.new(key_id))
    list_response.http.status_code.should eq(200)
    tags = list_response.result.tags || [] of KMS::Tag
    tags.map(&.tag_key).should eq(["Environment"])
    tags.map(&.tag_value).should eq(["test"])

    untag_response = client.untag_resource(KMS::UntagResourceRequest.new(key_id, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_resource_tags(KMS::ListResourceTagsRequest.new(key_id))
    list_response.http.status_code.should eq(200)
    (list_response.result.tags || [] of KMS::Tag).should be_empty
  end

  it "creates, lists and deletes an alias" do
    alias_name = "alias/amazonite-integration-test"

    create_response = client.create_alias(KMS::CreateAliasRequest.new(alias_name, key_id))
    create_response.http.status_code.should eq(200)

    list_response = client.list_aliases(KMS::ListAliasesRequest.new(key_id))
    list_response.http.status_code.should eq(200)
    aliases = list_response.result.aliases || [] of KMS::AliasListEntry
    aliases.map(&.alias_name).should eq([alias_name])

    delete_response = client.delete_alias(KMS::DeleteAliasRequest.new(alias_name))
    delete_response.http.status_code.should eq(200)
  end

  it "checks the key rotation status" do
    response = client.get_key_rotation_status(KMS::GetKeyRotationStatusRequest.new(key_id))
    response.http.status_code.should eq(200)

    response.result.key_rotation_enabled.should be_false
  end

  it "encrypts and decrypts data" do
    plaintext = "amazonite secret"

    encrypt_response = client.encrypt(KMS::EncryptRequest.new(key_id, Base64.strict_encode(plaintext)))
    encrypt_response.http.status_code.should eq(200)
    ciphertext = encrypt_response.result.ciphertext_blob || raise "expected a ciphertext blob in the response"

    decrypt_response = client.decrypt(KMS::DecryptRequest.new(ciphertext, key_id: key_id))
    decrypt_response.http.status_code.should eq(200)
    decrypted_plaintext = decrypt_response.result.plaintext || raise "expected plaintext in the response"
    Base64.decode_string(decrypted_plaintext).should eq(plaintext)
  end

  it "generates a data key" do
    response = client.generate_data_key(KMS::GenerateDataKeyRequest.new(key_id, number_of_bytes: 32))
    response.http.status_code.should eq(200)

    response.result.plaintext.should_not be_nil
    response.result.ciphertext_blob.should_not be_nil
  end

  it "lists keys" do
    response = client.list_keys(KMS::ListKeysRequest.new)
    response.http.status_code.should eq(200)

    key_ids = (response.result.keys || [] of KMS::KeyListEntry).map(&.key_id)
    key_ids.should contain(key_id)
  end

  it "schedules, cancels and re-schedules the key for deletion" do
    schedule_request = KMS::ScheduleKeyDeletionRequest.new(key_id, pending_window_in_days: 7)
    schedule_response = client.schedule_key_deletion(schedule_request)
    schedule_response.http.status_code.should eq(200)
    schedule_response.result.key_state.should eq(KMS::KeyState::PendingDeletion)

    cancel_response = client.cancel_key_deletion(KMS::CancelKeyDeletionRequest.new(key_id))
    cancel_response.http.status_code.should eq(200)
    cancel_response.result.key_id.try(&.ends_with?(key_id)).should be_true

    describe_response = client.describe_key(KMS::DescribeKeyRequest.new(key_id))
    describe_response.result.key_metadata.try(&.key_state).should eq(KMS::KeyState::Disabled)

    response = client.schedule_key_deletion(schedule_request)
    response.http.status_code.should eq(200)
    response.result.key_state.should eq(KMS::KeyState::PendingDeletion)
  end

  it "throws a typed error" do
    e = expect_raises(KMS::NotFoundException) do
      client.describe_key(KMS::DescribeKeyRequest.new("00000000-0000-0000-0000-000000000000"))
    end
    e.http.should_not be_nil
  end
end
