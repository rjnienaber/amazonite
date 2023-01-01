private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class UpdateDocumentRequest
    include JSON::Serializable

    @[JSON::Field(key: "Content")]
    property content : String

    @[JSON::Field(key: "Attachments")]
    property attachments : Array(AttachmentsSource) | Nil

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    def initialize(
      @content : String,
      @name : String,
      @attachments : Array(AttachmentsSource) | Nil = nil,
      @display_name : String | Nil = nil,
      @version_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @target_type : String | Nil = nil
    )
    end
  end
end
