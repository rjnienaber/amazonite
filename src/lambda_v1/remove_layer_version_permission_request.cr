module Amazonite::LambdaV1
  class RemoveLayerVersionPermissionRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the layer.
    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    # The version number.
    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    # The identifier that was specified when the statement was added.
    @[JSON::Field(key: "StatementId", ignore: true)]
    property statement_id : String = ""

    # Only update the policy if the revision ID matches the ID specified. Use this option to avoid
    # modifying a policy that has changed since you last read it.
    @[JSON::Field(key: "RevisionId", ignore: true)]
    property revision_id : String | Nil

    def initialize(
      @layer_name : String,
      @version_number : Int64,
      @statement_id : String,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
