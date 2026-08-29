module Amazonite::SsmV1
  class ListDocumentVersionsRequest
    include JSON::Serializable

    # The name of the document. You can specify an Amazon Resource Name (ARN).
    @[JSON::Field(key: "Name")]
    property name : String

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
