module Amazonite::KmsV1
  class ListKeyPoliciesRequest
    include JSON::Serializable

    # Gets the names of key policies for the specified KMS key.
    #
    # Specify the key ID or key ARN of the KMS key.
    #
    # For example:
    #
    # - Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # Use this parameter to specify the maximum number of items to return. When this value is present,
    # KMS does not return more than the specified number of items, but it might return fewer.
    #
    # This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you
    # do not include a value, it defaults to 100.
    #
    # Only one policy can be attached to a key.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Use this parameter in a subsequent request after you receive a response with truncated results.
    # Set it to the value of `NextMarker` from the truncated response you just received.
    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @key_id : String,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @limit, @marker)
  end
end
