module Amazonite::SsmV1
  class DescribeActivationsRequest
    include JSON::Serializable

    # A filter to view information about your activations.
    @[JSON::Field(key: "Filters")]
    property filters : Array(DescribeActivationsFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(DescribeActivationsFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@filters, @max_results, @next_token)
  end
end
