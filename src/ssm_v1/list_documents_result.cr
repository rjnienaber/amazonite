module Amazonite::SsmV1
  class ListDocumentsResult
    include JSON::Serializable

    @[JSON::Field(key: "DocumentIdentifiers")]
    property document_identifiers : Array(DocumentIdentifier) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @document_identifiers : Array(DocumentIdentifier) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
