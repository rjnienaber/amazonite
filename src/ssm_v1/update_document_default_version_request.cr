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

    def_equals_and_hash(@name, @document_version)
  end
end
