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
  end
end
