module Amazonite::SsmV1
  class DeleteDocumentRequest
    include JSON::Serializable

    # The name of the document.
    @[JSON::Field(key: "Name")]
    property name : String

    # The version of the document that you want to delete. If not provided, all versions of the
    # document are deleted.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The version name of the document that you want to delete. If not provided, all versions of the
    # document are deleted.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # Some SSM document types require that you specify a `Force` flag before you can delete the
    # document. For example, you must specify a `Force` flag to delete a document of type
    # `ApplicationConfigurationSchema`. You can restrict access to the `Force` flag in an Identity and
    # Access Management (IAM) policy.
    @[JSON::Field(key: "Force")]
    property force : Bool | Nil

    def initialize(
      @name : String,
      @document_version : String | Nil = nil,
      @version_name : String | Nil = nil,
      @force : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @document_version, @version_name, @force)
  end
end
