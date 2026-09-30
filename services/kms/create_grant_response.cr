private alias Core = Amazonite::Core

module Amazonite::Kms
  class CreateGrantResponse
    include JSON::Serializable

    # The grant token.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantToken")]
    property grant_token : String | Nil

    # The unique identifier for the grant.
    #
    # You can use the `GrantId` in a ListGrants, RetireGrant, or RevokeGrant operation.
    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    def initialize(
      @grant_token : String | Nil = nil,
      @grant_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @grant_token
        raise Core::ValidationError.new("GrantToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GrantToken length must be <= 8192") if value.size > 8192
      end

      if value = @grant_id
        raise Core::ValidationError.new("GrantId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GrantId length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@grant_token, @grant_id)
  end
end
