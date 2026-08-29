module Amazonite::KmsV1
  class UpdatePrimaryRegionRequest
    include JSON::Serializable

    # Identifies the current primary key. When the operation completes, this KMS key will be a replica
    # key.
    #
    # Specify the key ID or key ARN of a multi-Region primary key.
    #
    # For example:
    #
    # - Key ID: `mrk-1234abcd12ab34cd56ef1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The Amazon Web Services Region of the new primary key. Enter the Region ID, such as `us-east-1`
    # or `ap-southeast-2`. There must be an existing replica key in this Region.
    #
    # When the operation completes, the multi-Region key in this Region will be the primary key.
    @[JSON::Field(key: "PrimaryRegion")]
    property primary_region : String

    def initialize(
      @key_id : String,
      @primary_region : String,
    )
    end
  end
end
