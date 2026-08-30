module Amazonite::LambdaV1
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

    def_equals_and_hash(@layer_name, @version_number, @statement_id, @action, @principal, @organization_id, @revision_id)
  end
end
