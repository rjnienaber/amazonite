private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetDocumentResult
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The date the SSM document was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The friendly name of the SSM document. This value can differ for each version of the document.
    # If you want to update this value, see UpdateDocument.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The version of the artifact associated with the document. For example, 12.6. This value is
    # unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The document version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The status of the SSM document, such as `Creating`, `Active`, `Updating`, `Failed`, and
    # `Deleting`.
    @[JSON::Field(key: "Status", converter: AS::DocumentStatus)]
    property status : DocumentStatus | Nil

    # A message returned by Amazon Web Services Systems Manager that explains the `Status` value. For
    # example, a `Failed` status might be explained by the `StatusInformation` message, "The specified
    # S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct."
    @[JSON::Field(key: "StatusInformation")]
    property status_information : String | Nil

    # The contents of the SSM document.
    @[JSON::Field(key: "Content")]
    property content : String | Nil

    # The document type.
    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    # The document format, either JSON or YAML.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    # A list of SSM documents required by a document. For example, an `ApplicationConfiguration`
    # document requires an `ApplicationConfigurationSchema` document.
    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    # A description of the document attachments, including names, locations, sizes, and so on.
    @[JSON::Field(key: "AttachmentsContent")]
    property attachments_content : Array(AttachmentContent) | Nil

    # The current review status of a new custom Systems Manager document (SSM document) created by a
    # member of your organization, or of the latest version of an existing SSM document.
    #
    # Only one version of an SSM document can be in the APPROVED state at a time. When a new version
    # is approved, the status of the previous version changes to REJECTED.
    #
    # Only one version of an SSM document can be in review, or PENDING, at a time.
    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    def initialize(
      @name : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @display_name : String | Nil = nil,
      @version_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @status : DocumentStatus | Nil = nil,
      @status_information : String | Nil = nil,
      @content : String | Nil = nil,
      @document_type : DocumentType | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @requires : Array(DocumentRequires) | Nil = nil,
      @attachments_content : Array(AttachmentContent) | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
    )
    end
  end
end
