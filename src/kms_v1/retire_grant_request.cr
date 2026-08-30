private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class RetireGrantRequest
    include JSON::Serializable

    # Identifies the grant to be retired. You can use a grant token to identify a new grant even
    # before it has achieved eventual consistency.
    #
    # Only the CreateGrant operation returns a grant token. For details, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and
    # [Eventual
    # consistency](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency)
    # in the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantToken")]
    property grant_token : String | Nil

    # The key ARN KMS key associated with the grant. To find the key ARN, use the ListKeys operation.
    #
    # For example: `arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Identifies the grant to retire. To get the grant ID, use CreateGrant, ListGrants, or
    # ListRetirableGrants.
    #
    # - Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123
    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @grant_token : String | Nil = nil,
      @key_id : String | Nil = nil,
      @grant_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @grant_token
        raise Core::ValidationError.new("GrantToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GrantToken length must be <= 8192") if value.size > 8192
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @grant_id
        raise Core::ValidationError.new("GrantId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GrantId length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@grant_token, @key_id, @grant_id, @dry_run)
  end
end
