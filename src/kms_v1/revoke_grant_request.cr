module Amazonite::KmsV1
  class RevokeGrantRequest
    include JSON::Serializable

    # A unique identifier for the KMS key associated with the grant. To get the key ID and key ARN for
    # a KMS key, use ListKeys or DescribeKey.
    #
    # Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web
    # Services account, you must use the key ARN.
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

    # Identifies the grant to revoke. To get the grant ID, use CreateGrant, ListGrants, or
    # ListRetirableGrants.
    @[JSON::Field(key: "GrantId")]
    property grant_id : String

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @grant_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
