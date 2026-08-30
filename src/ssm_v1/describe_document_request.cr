module Amazonite::SsmV1
  class DescribeDocumentRequest
    include JSON::Serializable

    # The name of the SSM document.
    #
    # If you're calling a shared SSM document from a different Amazon Web Services account, `Name` is
    # the full Amazon Resource Name (ARN) of the document.
    @[JSON::Field(key: "Name")]
    property name : String

    # The document version for which you want information. Can be a specific version or the default
    # version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # An optional field specifying the version of the artifact associated with the document. For
    # example, 12.6. This value is unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    def initialize(
      @name : String,
      @document_version : String | Nil = nil,
      @version_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @document_version, @version_name)
  end
end
