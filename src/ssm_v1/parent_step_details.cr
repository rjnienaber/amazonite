module Amazonite::SsmV1
  # A detailed status of the parent step.
  class ParentStepDetails
    include JSON::Serializable

    # The unique ID of a step execution.
    @[JSON::Field(key: "StepExecutionId")]
    property step_execution_id : String | Nil

    # The name of the step.
    @[JSON::Field(key: "StepName")]
    property step_name : String | Nil

    # The name of the automation action.
    @[JSON::Field(key: "Action")]
    property action : String | Nil

    # The current repetition of the loop represented by an integer.
    @[JSON::Field(key: "Iteration")]
    property iteration : Int32 | Nil

    # The current value of the specified iterator in the loop.
    @[JSON::Field(key: "IteratorValue")]
    property iterator_value : String | Nil

    def initialize(
      @step_execution_id : String | Nil = nil,
      @step_name : String | Nil = nil,
      @action : String | Nil = nil,
      @iteration : Int32 | Nil = nil,
      @iterator_value : String | Nil = nil,
    )
    end

    def_equals_and_hash(@step_execution_id, @step_name, @action, @iteration, @iterator_value)
  end
end
