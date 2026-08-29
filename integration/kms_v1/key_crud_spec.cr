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

  it "schedules the key for deletion" do
    request = KMS::ScheduleKeyDeletionRequest.new(key_id, pending_window_in_days: 7)
    response = client.schedule_key_deletion(request)
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
