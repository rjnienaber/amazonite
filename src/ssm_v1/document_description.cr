private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes an Amazon Web Services Systems Manager document (SSM document).
  class DocumentDescription
    include JSON::Serializable

    # The SHA1 hash of the document, which you can use for verification.
    @[JSON::Field(key: "Sha1")]
    property sha_1 : String | Nil

    # The Sha256 or Sha1 hash created by the system when the document was created.
    #
    # Sha1 hashes have been deprecated.
    @[JSON::Field(key: "Hash")]
    property hash : String | Nil

    # The hash type of the document. Valid values include `Sha256` or `Sha1`.
    #
    # Sha1 hashes have been deprecated.
    @[JSON::Field(key: "HashType", converter: AS::DocumentHashType)]
    property hash_type : DocumentHashType | Nil

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The friendly name of the SSM document. This value can differ for each version of the document.
    # If you want to update this value, see UpdateDocument.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The version of the artifact associated with the document.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The Amazon Web Services user that created the document.
    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    # The date when the document was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The status of the SSM document.
    @[JSON::Field(key: "Status", converter: AS::DocumentStatus)]
    property status : DocumentStatus | Nil

    # A message returned by Amazon Web Services Systems Manager that explains the `Status` value. For
    # example, a `Failed` status might be explained by the `StatusInformation` message, "The specified
    # S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct."
    @[JSON::Field(key: "StatusInformation")]
    property status_information : String | Nil

    # The document version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # A description of the document.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # A description of the parameters for a document.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(DocumentParameter) | Nil

    # The list of operating system (OS) platforms compatible with this SSM document.
    @[JSON::Field(key: "PlatformTypes", converter: Core::ArrayConverter(AS::PlatformType))]
    property platform_types : Array(PlatformType) | Nil

    # The type of document.
    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    # The schema version.
    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    # The latest version of the document.
    @[JSON::Field(key: "LatestVersion")]
    property latest_version : String | Nil

    # The default version.
    @[JSON::Field(key: "DefaultVersion")]
    property default_version : String | Nil

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

    # Details about the document attachments, including names, locations, sizes, and so on.
    @[JSON::Field(key: "AttachmentsInformation")]
    property attachments_information : Array(AttachmentInformation) | Nil

    # A list of SSM documents required by a document. For example, an `ApplicationConfiguration`
    # document requires an `ApplicationConfigurationSchema` document.
    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    # The user in your organization who created the document.
    @[JSON::Field(key: "Author")]
    property author : String | Nil

    # Details about the review of a document.
    @[JSON::Field(key: "ReviewInformation")]
    property review_information : Array(ReviewInformation) | Nil

    # The version of the document currently approved for use in the organization.
    @[JSON::Field(key: "ApprovedVersion")]
    property approved_version : String | Nil

    # The version of the document that is currently under review.
    @[JSON::Field(key: "PendingReviewVersion")]
    property pending_review_version : String | Nil

    # The current status of the review.
    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    # The classification of a document to help you identify and categorize its use.
    @[JSON::Field(key: "Category")]
    property category : Array(String) | Nil

    # The value that identifies a document's category.
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
      @category_enum : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@sha_1, @hash, @hash_type, @name, @display_name, @version_name, @owner, @created_date, @status, @status_information, @document_version, @description, @parameters, @platform_types, @document_type, @schema_version, @latest_version, @default_version, @document_format, @target_type, @tags, @attachments_information, @requires, @author, @review_information, @approved_version, @pending_review_version, @review_status, @category, @category_enum)
  end
end
