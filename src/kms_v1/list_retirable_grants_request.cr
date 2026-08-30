module Amazonite::KmsV1
  class ListRetirableGrantsRequest
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

    # The retiring principal for which to list grants. Enter a principal in your Amazon Web Services
    # account.
    #
    # To specify the retiring principal, use the [Amazon Resource Name
    # (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) of an Amazon
    # Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM
    # roles, federated users, and assumed role users. For help with the ARN syntax for a principal,
    # see [IAM
    # ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns)
    # in the * *Identity and Access Management User Guide* *.
    #
    # You must specify either `RetiringPrincipal` or `RetiringServicePrincipal`, but not both.
    @[JSON::Field(key: "RetiringPrincipal")]
    property retiring_principal : String | Nil

    # The retiring service principal for which to list grants. This filter is only usable by callers
    # in a service principal.
    #
    # You must specify either `RetiringPrincipal` or `RetiringServicePrincipal`, but not both.
    @[JSON::Field(key: "RetiringServicePrincipal")]
    property retiring_service_principal : String | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @retiring_principal : String | Nil = nil,
      @retiring_service_principal : String | Nil = nil,
    )
    end

    def_equals_and_hash(@limit, @marker, @retiring_principal, @retiring_service_principal)
  end
end
