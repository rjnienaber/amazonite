module Amazonite::KmsV1
  class UntagResourceRequest
    include JSON::Serializable

    # Identifies the KMS key from which you are removing tags.
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

    # One or more tag keys. Specify only the tag keys, not the tag values.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @key_id : String,
      @tag_keys : Array(String),
    )
    end
  end
end
