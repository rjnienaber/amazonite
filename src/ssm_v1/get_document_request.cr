private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetDocumentRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    def initialize(
      @name : String,
      @version_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @document_format : DocumentFormat | Nil = nil
    )
    end
  end
end
