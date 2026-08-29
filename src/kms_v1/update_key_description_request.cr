module Amazonite::KmsV1
  class UpdateKeyDescriptionRequest
    include JSON::Serializable

    # Updates the description of the specified KMS key.
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

    # New description for the KMS key.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    @[JSON::Field(key: "Description")]
    property description : String

    def initialize(
      @key_id : String,
      @description : String,
    )
    end
  end
end
