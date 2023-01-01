module Amazonite::SsmV1
  class ListDocumentVersionsResult
    include JSON::Serializable

    @[JSON::Field(key: "DocumentVersions")]
    property document_versions : Array(DocumentVersionInfo) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @document_versions : Array(DocumentVersionInfo) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
