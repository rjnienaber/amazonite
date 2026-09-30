private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class CreateGrantRequest
    include JSON::Serializable

    # Identifies the KMS key for the grant. The grant gives principals permission to use this KMS key.
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

    # The identity that gets the permissions specified in the grant.
    #
    # To specify the grantee principal, use the Amazon Resource Name (ARN) of an Amazon Web Services
    # principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles,
    # federated users, and assumed role users. For help with the ARN syntax for a principal, see [IAM
    # ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns)
    # in the * *Identity and Access Management User Guide* *.
    #
    # You must specify either `GranteePrincipal` or `GranteeServicePrincipal`, but not both.
    @[JSON::Field(key: "GranteePrincipal")]
    property grantee_principal : String | Nil

    # The principal that has permission to use the RetireGrant operation to retire the grant.
    #
    # To specify the principal, use the [Amazon Resource Name
    # (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) of an Amazon
    # Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM
    # roles, federated users, and assumed role users. For help with the ARN syntax for a principal,
    # see [IAM
    # ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns)
    # in the * *Identity and Access Management User Guide* *.
    #
    # The grant determines the retiring principal. Other principals might have permission to retire
    # the grant or revoke the grant. For details, see RevokeGrant and [Retiring and revoking
    # grants](https://docs.aws.amazon.com/kms/latest/developerguide/grant-delete.html) in the *Key
    # Management Service Developer Guide*.
    #
    # You can specify either `RetiringPrincipal` or `RetiringServicePrincipal`, but not both.
    @[JSON::Field(key: "RetiringPrincipal")]
    property retiring_principal : String | Nil

    # A list of operations that the grant permits.
    #
    # This list must include only operations that are permitted in a grant. Also, the operation must
    # be supported on the KMS key. For example, you cannot create a grant for a symmetric encryption
    # KMS key that allows the Sign operation, or a grant for an asymmetric KMS key that allows the
    # GenerateDataKey operation. If you try, KMS returns a `ValidationError` exception. For details,
    # see [Grant
    # operations](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations)
    # in the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "Operations", converter: Core::ArrayConverter(AK::GrantOperation))]
    property operations : Array(GrantOperation) = [] of GrantOperation

    # Specifies a grant constraint.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # KMS supports the following grant constraints.
    #
    # - `EncryptionContextEquals` and `EncryptionContextSubset` — These encryption context grant
    # constraints allow the permissions in the grant only when the encryption context in the request
    # matches (`EncryptionContextEquals`) or includes (`EncryptionContextSubset`) the encryption
    # context specified in the constraint.
    #
    # Encryption context grant constraints are supported only on [grant
    # operations](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations)
    # that include an `EncryptionContext` parameter, such as cryptographic operations on symmetric
    # encryption KMS keys. You cannot use an encryption context grant constraint for cryptographic
    # operations with asymmetric KMS keys or HMAC KMS keys. Operations with these keys don't support
    # an encryption context. Grants with encryption context grant constraints can include the
    # DescribeKey and RetireGrant operations, but the constraint doesn't apply to these operations. If
    # a grant with an encryption context grant constraint includes the `CreateGrant` operation, the
    # constraint requires that any grants created with the `CreateGrant` permission have an equally
    # strict or stricter encryption context constraint.
    #
    # Each constraint value can include up to 8 encryption context pairs. The encryption context value
    # in each constraint cannot exceed 384 characters. For more information about encryption context,
    # see [Encryption
    # context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context) in
    # the * *Key Management Service Developer Guide* *.
    #
    # - `SourceArn` — This grant constraint allows the permissions in the grant only when the request
    # is made on behalf of a specific Amazon Web Services resource, identified by its [Amazon Resource
    # Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html). This is
    # effectively the same as having the
    # [aws:SourceArn](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn)
    # global condition key in the grant. The SourceArn constraint is supported on grants for all types
    # of KMS keys and can also be applied to the DescribeKey operation when specified in the request.
    # However, it does not apply to RetireGrant operation.
    #
    # For information about grant constraints, see [Using grant
    # constraints](https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints)
    # in the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "Constraints")]
    property constraints : GrantConstraints | Nil

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    # A friendly name for the grant. Use this value to prevent the unintended creation of duplicate
    # grants when retrying this request.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # When this value is absent, all `CreateGrant` requests result in a new grant with a unique
    # `GrantId` even if all the supplied parameters are identical. This can result in unintended
    # duplicates when you retry the `CreateGrant` request.
    #
    # When this value is present, you can retry a `CreateGrant` request with identical parameters; if
    # the grant already exists, the original `GrantId` is returned without creating a new grant. Note
    # that the returned grant token is unique with every `CreateGrant` request, even when a duplicate
    # `GrantId` is returned. All grant tokens for the same grant ID can be used interchangeably.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    # The Amazon Web Services [service
    # principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services)
    # that gets the permissions specified in the grant.
    #
    # When you specify a `GranteeServicePrincipal`, you must also specify a `SourceArn` grant
    # constraint. In addition, you must specify either a `RetiringPrincipal` or a
    # `RetiringServicePrincipal`.
    #
    # You must specify either `GranteePrincipal` or `GranteeServicePrincipal`, but not both.
    @[JSON::Field(key: "GranteeServicePrincipal")]
    property grantee_service_principal : String | Nil

    # The Amazon Web Services [service
    # principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services)
    # that has permission to use the RetireGrant operation to retire the grant.
    #
    # You can specify either `RetiringPrincipal` or `RetiringServicePrincipal`, but not both.
    @[JSON::Field(key: "RetiringServicePrincipal")]
    property retiring_service_principal : String | Nil

    def initialize(
      @key_id : String,
      @operations : Array(GrantOperation),
      @grantee_principal : String | Nil = nil,
      @retiring_principal : String | Nil = nil,
      @constraints : GrantConstraints | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @name : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @grantee_service_principal : String | Nil = nil,
      @retiring_service_principal : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @grantee_principal
        raise Core::ValidationError.new("GranteePrincipal length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GranteePrincipal length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("GranteePrincipal does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@:/-]+$"))
      end

      if value = @retiring_principal
        raise Core::ValidationError.new("RetiringPrincipal length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RetiringPrincipal length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("RetiringPrincipal does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@:/-]+$"))
      end

      if value = @constraints
        value.validate!
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/_-]+$"))
      end

      if value = @grantee_service_principal
        raise Core::ValidationError.new("GranteeServicePrincipal length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GranteeServicePrincipal length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("GranteeServicePrincipal does not match the required pattern") unless value.matches?(Regex.new("^([A-Za-z0-9\\-]+)\\.([A-Za-z0-9\\-]+)(\\.[A-Za-z0-9\\-]+)+$"))
      end

      if value = @retiring_service_principal
        raise Core::ValidationError.new("RetiringServicePrincipal length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RetiringServicePrincipal length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RetiringServicePrincipal does not match the required pattern") unless value.matches?(Regex.new("^([A-Za-z0-9\\-]+)\\.([A-Za-z0-9\\-]+)(\\.[A-Za-z0-9\\-]+)+$"))
      end
    end

    def_equals_and_hash(@key_id, @grantee_principal, @retiring_principal, @operations, @constraints, @grant_tokens, @name, @dry_run, @grantee_service_principal, @retiring_service_principal)
  end
end
