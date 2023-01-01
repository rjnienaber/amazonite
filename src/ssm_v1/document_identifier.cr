private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DocumentIdentifier
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    @[JSON::Field(key: "PlatformTypes")]
    property platform_types : Array(PlatformType) | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    @[JSON::Field(key: "Author")]
    property author : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @display_name : String | Nil = nil,
      @owner : String | Nil = nil,
      @version_name : String | Nil = nil,
      @platform_types : Array(PlatformType) | Nil = nil,
      @document_version : String | Nil = nil,
      @document_type : DocumentType | Nil = nil,
      @schema_version : String | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @target_type : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @requires : Array(DocumentRequires) | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
      @author : String | Nil = nil
    )
    end
  end
end
