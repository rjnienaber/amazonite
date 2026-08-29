private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Version information about the document.
  class DocumentVersionInfo
    include JSON::Serializable

    # The document name.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The friendly name of the SSM document. This value can differ for each version of the document.
    # If you want to update this value, see UpdateDocument.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The document version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The version of the artifact associated with the document. For example, 12.6. This value is
    # unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The date the document was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # An identifier for the default version of the document.
    @[JSON::Field(key: "IsDefaultVersion")]
    property is_default_version : Bool | Nil

    # The document format, either JSON or YAML.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    # The status of the SSM document, such as `Creating`, `Active`, `Failed`, and `Deleting`.
    @[JSON::Field(key: "Status", converter: AS::DocumentStatus)]
    property status : DocumentStatus | Nil

    # A message returned by Amazon Web Services Systems Manager that explains the `Status` value. For
    # example, a `Failed` status might be explained by the `StatusInformation` message, "The specified
    # S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct."
    @[JSON::Field(key: "StatusInformation")]
    property status_information : String | Nil

    # The current status of the approval review for the latest version of the document.
    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    def initialize(
      @name : String | Nil = nil,
      @display_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @version_name : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @is_default_version : Bool | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @status : DocumentStatus | Nil = nil,
      @status_information : String | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
    )
    end
  end
end
