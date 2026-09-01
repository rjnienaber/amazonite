private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ListDocumentsResult
    include JSON::Serializable

    # The names of the SSM documents.
    @[JSON::Field(key: "DocumentIdentifiers")]
    property document_identifiers : Array(DocumentIdentifier) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @document_identifiers : Array(DocumentIdentifier) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @document_identifiers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@document_identifiers, @next_token)
  end
end
