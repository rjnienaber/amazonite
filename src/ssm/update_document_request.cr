private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class UpdateDocumentRequest
    include JSON::Serializable

    # A valid JSON or YAML string.
    @[JSON::Field(key: "Content")]
    property content : String

    # A list of key-value pairs that describe attachments to a version of a document.
    @[JSON::Field(key: "Attachments")]
    property attachments : Array(AttachmentsSource) | Nil

    # The name of the SSM document that you want to update.
    @[JSON::Field(key: "Name")]
    property name : String

    # The friendly name of the SSM document that you want to update. This value can differ for each
    # version of the document. If you don't specify a value for this parameter in your request, the
    # existing value is applied to the new document version.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # An optional field specifying the version of the artifact you are updating with the document. For
    # example, 12.6. This value is unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The version of the document that you want to update. Currently, Systems Manager supports
    # updating only the latest version of the document. You can specify the version number of the
    # latest version or use the `$LATEST` variable.
    #
    # If you change a document version for a State Manager association, Systems Manager immediately
    # runs the association unless you previously specifed the `apply-only-at-cron-interval` parameter.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # Specify the document format for the new document version. Systems Manager supports JSON and YAML
    # documents. JSON is the default format.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    # Specify a new target type for the document.
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
      @target_type : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @content
        raise Core::ValidationError.new("Content length must be >= 1") if value.size < 1
      end

      if value = @attachments
        raise Core::ValidationError.new("Attachments must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Attachments must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end

      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
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

      if value = @target_type
        raise Core::ValidationError.new("TargetType length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TargetType length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("TargetType does not match the required pattern") unless value.matches?(Regex.new("^\\/[\\w\\.\\-\\:\\/]*$"))
      end
    end

    def_equals_and_hash(@content, @attachments, @name, @display_name, @version_name, @document_version, @document_format, @target_type)
  end
end
