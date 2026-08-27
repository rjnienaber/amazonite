module Amazonite::SsmV1
  class ParentStepDetails
    include JSON::Serializable

    @[JSON::Field(key: "StepExecutionId")]
    property step_execution_id : String | Nil

    @[JSON::Field(key: "StepName")]
    property step_name : String | Nil

    @[JSON::Field(key: "Action")]
    property action : String | Nil

    @[JSON::Field(key: "Iteration")]
    property iteration : Int32 | Nil

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
  end
end
