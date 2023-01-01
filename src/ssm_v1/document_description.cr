private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DocumentDescription
    include JSON::Serializable

    @[JSON::Field(key: "Sha1")]
    property sha_1 : String | Nil

    @[JSON::Field(key: "Hash")]
    property hash : String | Nil

    @[JSON::Field(key: "HashType", converter: AS::DocumentHashType)]
    property hash_type : DocumentHashType | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    @[JSON::Field(key: "Status", converter: AS::DocumentStatus)]
    property status : DocumentStatus | Nil

    @[JSON::Field(key: "StatusInformation")]
    property status_information : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(DocumentParameter) | Nil

    @[JSON::Field(key: "PlatformTypes")]
    property platform_types : Array(PlatformType) | Nil

    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    @[JSON::Field(key: "LatestVersion")]
    property latest_version : String | Nil

    @[JSON::Field(key: "DefaultVersion")]
    property default_version : String | Nil

    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "AttachmentsInformation")]
    property attachments_information : Array(AttachmentInformation) | Nil

    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    @[JSON::Field(key: "Author")]
    property author : String | Nil

    @[JSON::Field(key: "ReviewInformation")]
    property review_information : Array(ReviewInformation) | Nil

    @[JSON::Field(key: "ApprovedVersion")]
    property approved_version : String | Nil

    @[JSON::Field(key: "PendingReviewVersion")]
    property pending_review_version : String | Nil

    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    @[JSON::Field(key: "Category")]
    property category : Array(String) | Nil

    @[JSON::Field(key: "CategoryEnum")]
    property category_enum : Array(String) | Nil

    def initialize(
      @sha_1 : String | Nil = nil,
      @hash : String | Nil = nil,
      @hash_type : DocumentHashType | Nil = nil,
      @name : String | Nil = nil,
      @display_name : String | Nil = nil,
      @version_name : String | Nil = nil,
      @owner : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @status : DocumentStatus | Nil = nil,
      @status_information : String | Nil = nil,
      @document_version : String | Nil = nil,
      @description : String | Nil = nil,
      @parameters : Array(DocumentParameter) | Nil = nil,
      @platform_types : Array(PlatformType) | Nil = nil,
      @document_type : DocumentType | Nil = nil,
      @schema_version : String | Nil = nil,
      @latest_version : String | Nil = nil,
      @default_version : String | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @target_type : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @attachments_information : Array(AttachmentInformation) | Nil = nil,
      @requires : Array(DocumentRequires) | Nil = nil,
      @author : String | Nil = nil,
      @review_information : Array(ReviewInformation) | Nil = nil,
      @approved_version : String | Nil = nil,
      @pending_review_version : String | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
      @category : Array(String) | Nil = nil,
      @category_enum : Array(String) | Nil = nil
    )
    end
  end
end
