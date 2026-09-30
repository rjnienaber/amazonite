private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DisplayName length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\w\\.\\-\\:\\/ ]*$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end
    end

    def_equals_and_hash(@name, @display_name, @document_version, @version_name, @created_date, @is_default_version, @document_format, @status, @status_information, @review_status)
  end
end
