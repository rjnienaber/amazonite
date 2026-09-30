private alias Core = Amazonite::Core

module Amazonite::Lambda
  class AddLayerVersionPermissionRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the layer.
    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    # The version number.
    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    # An identifier that distinguishes the policy from others on the same layer version.
    @[JSON::Field(key: "StatementId")]
    property statement_id : String

    # The API action that grants access to the layer. For example, `lambda:GetLayerVersion`.
    @[JSON::Field(key: "Action")]
    property action : String

    # An account ID, or `*` to grant layer usage permission to all accounts in an organization, or all
    # Amazon Web Services accounts (if `organizationId` is not specified). For the last case, make
    # sure that you really do want all Amazon Web Services accounts to have usage permission to this
    # layer.
    @[JSON::Field(key: "Principal")]
    property principal : String

    # With the principal set to `*`, grant permission to all accounts in the specified organization.
    @[JSON::Field(key: "OrganizationId")]
    property organization_id : String | Nil

    # Only update the policy if the revision ID matches the ID specified. Use this option to avoid
    # modifying a policy that has changed since you last read it.
    @[JSON::Field(key: "RevisionId", ignore: true)]
    property revision_id : String | Nil

    def initialize(
      @layer_name : String,
      @version_number : Int64,
      @statement_id : String,
      @action : String,
      @principal : String,
      @organization_id : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @layer_name
        raise Core::ValidationError.new("LayerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("LayerName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end

      if value = @statement_id
        raise Core::ValidationError.new("StatementId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatementId length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("StatementId does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z0-9-_]+)$"))
      end

      if value = @action
        raise Core::ValidationError.new("Action length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Action length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("Action does not match the required pattern") unless value.matches?(Regex.new("^lambda:GetLayerVersion$"))
      end

      if value = @principal
        raise Core::ValidationError.new("Principal length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Principal length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("Principal does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}|\\*|arn:(aws[a-zA-Z-]*):iam::\\d{12}:root$"))
      end

      if value = @organization_id
        raise Core::ValidationError.new("OrganizationId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("OrganizationId length must be <= 34") if value.size > 34
        raise Core::ValidationError.new("OrganizationId does not match the required pattern") unless value.matches?(Regex.new("^o-[a-z0-9]{10,32}$"))
      end
    end

    def_equals_and_hash(@layer_name, @version_number, @statement_id, @action, @principal, @organization_id, @revision_id)
  end
end
