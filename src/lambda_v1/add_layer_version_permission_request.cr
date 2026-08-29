module Amazonite::LambdaV1
  class AddLayerVersionPermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    @[JSON::Field(key: "StatementId")]
    property statement_id : String

    @[JSON::Field(key: "Action")]
    property action : String

    @[JSON::Field(key: "Principal")]
    property principal : String

    @[JSON::Field(key: "OrganizationId")]
    property organization_id : String | Nil

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
  end
end
