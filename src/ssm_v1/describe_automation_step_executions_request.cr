private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeAutomationStepExecutionsRequest
    include JSON::Serializable

    # The Automation execution ID for which you want step execution descriptions.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    # One or more filters to limit the number of step executions returned by the request.
    @[JSON::Field(key: "Filters")]
    property filters : Array(StepExecutionFilter) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # Indicates whether to list step executions in reverse order by start time. The default value is
    # 'false'.
    @[JSON::Field(key: "ReverseOrder")]
    property reverse_order : Bool | Nil

    def initialize(
      @automation_execution_id : String,
      @filters : Array(StepExecutionFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @reverse_order : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @automation_execution_id
        raise Core::ValidationError.new("AutomationExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("AutomationExecutionId length must be <= 36") if value.size > 36
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 6 item(s)") if value.size > 6
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@automation_execution_id, @filters, @next_token, @max_results, @reverse_order)
  end
end
