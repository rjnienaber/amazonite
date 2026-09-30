private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DisplayName length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\w\\.\\-\\:\\/ ]*$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @content
        raise Core::ValidationError.new("Content length must be >= 1") if value.size < 1
      end

      if value = @requires
        raise Core::ValidationError.new("Requires must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @attachments_content
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@name, @created_date, @display_name, @version_name, @document_version, @status, @status_information, @content, @document_type, @document_format, @requires, @attachments_content, @review_status)
  end
end
