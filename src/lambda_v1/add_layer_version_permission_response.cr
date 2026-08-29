module Amazonite::LambdaV1
  class AddLayerVersionPermissionResponse
    include JSON::Serializable

    @[JSON::Field(key: "Statement")]
    property statement : String | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @statement : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
