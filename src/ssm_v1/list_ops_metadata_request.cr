module Amazonite::SsmV1
  class ListOpsMetadataRequest
    include JSON::Serializable

    # One or more filters to limit the number of OpsMetadata objects returned by the call.
    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsMetadataFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(OpsMetadataFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
