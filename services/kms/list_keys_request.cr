private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class ListKeysRequest
    include JSON::Serializable

    # Use this parameter to specify the maximum number of items to return. When this value is present,
    # KMS does not return more than the specified number of items, but it might return fewer.
    #
    # This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you
    # do not include a value, it defaults to 100.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Use this parameter in a subsequent request after you receive a response with truncated results.
    # Set it to the value of `NextMarker` from the truncated response you just received.
    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    # Specifies whose KMS keys to list. Use this parameter to list KMS keys that other Amazon Web
    # Services accounts shared with your Amazon Web Services account through Resource Access Manager
    # (RAM).
    #
    # Specify one or two values. Valid values are:
    #
    # SELF Lists the KMS keys in your Amazon Web Services account and Region.
    #
    # OTHER_ACCOUNTS_VIA_RAM Lists the KMS keys in the Region that other Amazon Web Services accounts
    # currently share with your Amazon Web Services account through RAM. This list doesn't include KMS
    # keys that your Amazon Web Services account owns. For each of these KMS keys, the key ARN in the
    # response contains the account ID of the Amazon Web Services account that owns the KMS key.
    #
    # If you omit this parameter, `ListKeys` lists only the KMS keys in your Amazon Web Services
    # account. If you specify both values, in either order, `ListKeys` returns the KMS keys in your
    # Amazon Web Services account first, and then the KMS keys that other Amazon Web Services accounts
    # shared with you. A single response doesn't contain both kinds of KMS keys.
    #
    # When `ResourceOwners` includes `OTHER_ACCOUNTS_VIA_RAM`, a response can contain fewer KMS keys
    # than the `Limit` value, or none, even when `Truncated` is true. To get all of the KMS keys,
    # continue calling `ListKeys` with the `NextMarker` value from each response until `Truncated` is
    # false. Use a `NextMarker` value only in a request that has the same `ResourceOwners` value as
    # the request that returned it. Otherwise, the request can fail with an `InvalidMarkerException`.
    #
    # KMS keys that other Amazon Web Services accounts share with you can take some time to appear in
    # or disappear from the results after changes to resource shares.
    @[JSON::Field(key: "ResourceOwners", converter: Core::ArrayConverter(AK::ResourceOwnerType))]
    property resource_owners : Array(ResourceOwnerType) | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @resource_owners : Array(ResourceOwnerType) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 1000") if value > 1000
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]*$"))
      end

      if value = @resource_owners
        raise Core::ValidationError.new("ResourceOwners must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ResourceOwners must have at most 2 item(s)") if value.size > 2
      end
    end

    def_equals_and_hash(@limit, @marker, @resource_owners)
  end
end
