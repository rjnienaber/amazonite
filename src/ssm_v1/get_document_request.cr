private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetDocumentRequest
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String

    # An optional field specifying the version of the artifact associated with the document. For
    # example, 12.6. This value is unique across all versions of a document and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The document version for which you want information.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # Returns the document in the specified format. The document format can be either JSON or YAML.
    # JSON is the default format.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    def initialize(
      @name : String,
      @version_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end
    end

    def_equals_and_hash(@name, @version_name, @document_version, @document_format)
  end
end
