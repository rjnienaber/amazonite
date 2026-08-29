module Amazonite::LambdaV1
  class ExecutionStartedDetails
    include JSON::Serializable

    @[JSON::Field(key: "Input")]
    property input : EventInput

    @[JSON::Field(key: "ExecutionTimeout")]
    property execution_timeout : Int32

    def initialize(
      @input : EventInput,
      @execution_timeout : Int32,
    )
    end
  end
end
