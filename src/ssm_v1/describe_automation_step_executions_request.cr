module Amazonite::SsmV1
  class DescribeAutomationStepExecutionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    @[JSON::Field(key: "Filters")]
    property filters : Array(StepExecutionFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "ReverseOrder")]
    property reverse_order : Bool | Nil

    def initialize(
      @automation_execution_id : String,
      @filters : Array(StepExecutionFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @reverse_order : Bool | Nil = nil
    )
    end
  end
end
