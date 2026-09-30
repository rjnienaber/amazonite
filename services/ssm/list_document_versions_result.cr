private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @document_versions
        raise Core::ValidationError.new("DocumentVersions must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@document_versions, @next_token)
  end
end
