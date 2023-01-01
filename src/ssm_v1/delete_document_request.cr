module Amazonite::SsmV1
  class DeleteDocumentRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    @[JSON::Field(key: "Force")]
    property force : Bool | Nil

    def initialize(
      @name : String,
      @document_version : String | Nil = nil,
      @version_name : String | Nil = nil,
      @force : Bool | Nil = nil
    )
    end
  end
end
