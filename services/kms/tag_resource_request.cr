private alias Core = Amazonite::Core

module Amazonite::Kms
  class TagResourceRequest
    include JSON::Serializable

    # Identifies a customer managed key in the account and Region.
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

    # One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an empty
    # (null) string.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing
    # tag key with a different tag value, KMS replaces the current tag value with the specified one.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @key_id : String,
      @tags : Array(Tag),
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_id, @tags)
  end
end
