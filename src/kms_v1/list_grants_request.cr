module Amazonite::KmsV1
  class ListGrantsRequest
    include JSON::Serializable

    # Use this parameter to specify the maximum number of items to return. When this value is present,
    # KMS does not return more than the specified number of items, but it might return fewer.
    #
    # This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you
    # do not include a value, it defaults to 50.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Use this parameter in a subsequent request after you receive a response with truncated results.
    # Set it to the value of `NextMarker` from the truncated response you just received.
    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    # Returns only grants for the specified KMS key. This parameter is required.
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

    # Returns only the grant with the specified grant ID. The grant ID uniquely identifies the grant.
    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    # Returns only grants where the specified principal is the grantee principal for the grant.
    #
    # You can specify either `GranteePrincipal` or `GranteeServicePrincipal`, but not both.
    @[JSON::Field(key: "GranteePrincipal")]
    property grantee_principal : String | Nil

    # Returns only grants where the specified Amazon Web Services service principal is the grantee
    # service principal for the grant. This filter is only usable by callers in a service principal.
    #
    # You can specify either `GranteePrincipal` or `GranteeServicePrincipal`, but not both.
    @[JSON::Field(key: "GranteeServicePrincipal")]
    property grantee_service_principal : String | Nil

    def initialize(
      @key_id : String,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @grant_id : String | Nil = nil,
      @grantee_principal : String | Nil = nil,
      @grantee_service_principal : String | Nil = nil,
    )
    end
  end
end
