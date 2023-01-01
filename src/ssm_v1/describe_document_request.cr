module Amazonite::SsmV1
  class DescribeDocumentRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    def initialize(
      @name : String,
      @document_version : String | Nil = nil,
      @version_name : String | Nil = nil
    )
    end
  end
end
