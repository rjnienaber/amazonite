private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@filters, @max_results, @next_token)
  end
end
