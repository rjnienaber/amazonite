module Amazonite::LambdaV1
  class RemoveLayerVersionPermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    @[JSON::Field(key: "StatementId", ignore: true)]
    property statement_id : String = ""

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
