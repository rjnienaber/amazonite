private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ComplianceExecutionSummary
    include JSON::Serializable

    @[JSON::Field(key: "ExecutionTime", converter: Core::AWSEpochConverter)]
    property execution_time : Time

    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    @[JSON::Field(key: "ExecutionType")]
    property execution_type : String | Nil

    def initialize(
      @execution_time : Time,
      @execution_id : String | Nil = nil,
      @execution_type : String | Nil = nil
    )
    end
  end
end
