private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes the name of a SSM document.
  class DocumentIdentifier
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The date the SSM document was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # An optional field where you can specify a friendly name for the SSM document. This value can
    # differ for each version of the document. If you want to update this value, see UpdateDocument.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The Amazon Web Services user that created the document.
    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    # An optional field specifying the version of the artifact associated with the document. For
    # example, 12.6. This value is unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The operating system platform.
    @[JSON::Field(key: "PlatformTypes", converter: Core::ArrayConverter(AS::PlatformType))]
    property platform_types : Array(PlatformType) | Nil

    # The document version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The document type.
    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    # The schema version.
    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    # The document format, either JSON or YAML.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    # The target type which defines the kinds of resources the document can run on. For example,
    # `/AWS::EC2::Instance`. For a list of valid resource types, see [Amazon Web Services resource and
    # property types
    # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
    # in the *CloudFormation User Guide*.
    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    # The tags, or metadata, that have been applied to the document.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # A list of SSM documents required by a document. For example, an `ApplicationConfiguration`
    # document requires an `ApplicationConfigurationSchema` document.
    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    # The current status of a document review.
    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    # The user in your organization who created the document.
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
      @author : String | Nil = nil,
    )
    end
  end
end
