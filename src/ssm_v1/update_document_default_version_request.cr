private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UpdateDocumentDefaultVersionRequest
    include JSON::Serializable

    # The name of a custom document that you want to set as the default version.
    @[JSON::Field(key: "Name")]
    property name : String

    # The version of a custom document that you want to set as the default version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String

    def initialize(
      @name : String,
      @document_version : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^(^[1-9][0-9]*$)$"))
      end
    end

    def_equals_and_hash(@name, @document_version)
  end
end
