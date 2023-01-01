module Amazonite::SsmV1
  class UpdateDocumentDefaultVersionRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String

    def initialize(
      @name : String,
      @document_version : String
    )
    end
  end
end
