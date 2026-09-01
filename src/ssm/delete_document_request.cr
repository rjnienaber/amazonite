private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end
    end

    def_equals_and_hash(@name, @document_version, @version_name, @force)
  end
end
