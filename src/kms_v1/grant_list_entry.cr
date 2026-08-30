private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Contains information about a grant.
  class GrantListEntry
    include JSON::Serializable

    # The unique identifier for the KMS key to which the grant applies.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The unique identifier for the grant.
    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    # The friendly name that identifies the grant. If a name was provided in the CreateGrant request,
    # that name is returned. Otherwise this value is null.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The date and time when the grant was created.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    # The identity that gets the permissions in the grant.
    #
    # When a grant is created with the `GranteePrincipal` field, the `ListGrants` response usually
    # contains the user or role designated as the grantee principal in the grant. However, if the
    # grantee principal is an Amazon Web Services service, the `GranteePrincipal` field contains an
    # Amazon Web Services [service
    # principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services),
    # which might correspond to several different grantee principals, such as an IAM user, IAM role,
    # or Amazon Web Services account.
    @[JSON::Field(key: "GranteePrincipal")]
    property grantee_principal : String | Nil

    # The principal that can retire the grant.
    @[JSON::Field(key: "RetiringPrincipal")]
    property retiring_principal : String | Nil

    # The Amazon Web Services account under which the grant was issued.
    @[JSON::Field(key: "IssuingAccount")]
    property issuing_account : String | Nil

    # The list of operations permitted by the grant.
    @[JSON::Field(key: "Operations", converter: Core::ArrayConverter(AK::GrantOperation))]
    property operations : Array(GrantOperation) | Nil

    # The constraints on the grant, such as encryption context pairs or a SourceArn, that restrict the
    # subsequent operations the grant allows.
    @[JSON::Field(key: "Constraints")]
    property constraints : GrantConstraints | Nil

    # The Amazon Web Services [service
    # principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services)
    # that gets the permissions in the grant.
    @[JSON::Field(key: "GranteeServicePrincipal")]
    property grantee_service_principal : String | Nil

    # The Amazon Web Services [service
    # principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services)
    # that can retire the grant.
    @[JSON::Field(key: "RetiringServicePrincipal")]
    property retiring_service_principal : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @grant_id : String | Nil = nil,
      @name : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @grantee_principal : String | Nil = nil,
      @retiring_principal : String | Nil = nil,
      @issuing_account : String | Nil = nil,
      @operations : Array(GrantOperation) | Nil = nil,
      @constraints : GrantConstraints | Nil = nil,
      @grantee_service_principal : String | Nil = nil,
      @retiring_service_principal : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @grant_id
        raise Core::ValidationError.new("GrantId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GrantId length must be <= 128") if value.size > 128
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/_-]+$"))
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

      if value = @issuing_account
        raise Core::ValidationError.new("IssuingAccount length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IssuingAccount length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("IssuingAccount does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@:/-]+$"))
      end

      if value = @constraints
        value.validate!
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

    def_equals_and_hash(@key_id, @grant_id, @name, @creation_date, @grantee_principal, @retiring_principal, @issuing_account, @operations, @constraints, @grantee_service_principal, @retiring_service_principal)
  end
end
