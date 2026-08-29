module Amazonite::SsmV1
  class ListDocumentVersionsResult
    include JSON::Serializable

    # The document versions.
    @[JSON::Field(key: "DocumentVersions")]
    property document_versions : Array(DocumentVersionInfo) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @document_versions : Array(DocumentVersionInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
