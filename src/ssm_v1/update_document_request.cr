private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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

    def_equals_and_hash(@content, @attachments, @name, @display_name, @version_name, @document_version, @document_format, @target_type)
  end
end
