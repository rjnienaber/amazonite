module Amazonite::SsmV1
  class DescribeAutomationExecutionsRequest
    include JSON::Serializable

    # Filters used to limit the scope of executions that are requested.
    @[JSON::Field(key: "Filters")]
    property filters : Array(AutomationExecutionFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(AutomationExecutionFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
