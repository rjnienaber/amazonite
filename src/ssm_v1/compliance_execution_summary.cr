private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A summary of the call execution that includes an execution ID, the type of execution (for
  # example, `Command`), and the date/time of the execution using a datetime object that is saved in
  # the following format: `yyyy-MM-dd'T'HH:mm:ss'Z'`
  class ComplianceExecutionSummary
    include JSON::Serializable

    # The time the execution ran as a datetime object that is saved in the following format:
    # `yyyy-MM-dd'T'HH:mm:ss'Z'`
    #
    # For State Manager associations, this timestamp represents when the compliance status was
    # captured and reported by the Systems Manager service, not when the underlying association was
    # actually executed on the managed node. To track actual association execution times, use the
    # DescribeAssociationExecutionTargets command or check the association execution history in the
    # Systems Manager console.
    @[JSON::Field(key: "ExecutionTime", converter: Core::AWSEpochConverter)]
    property execution_time : Time

    # An ID created by the system when `PutComplianceItems` was called. For example, `CommandID` is a
    # valid execution ID. You can use this ID in subsequent calls.
    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    # The type of execution. For example, `Command` is a valid execution type.
    @[JSON::Field(key: "ExecutionType")]
    property execution_type : String | Nil

    def initialize(
      @execution_time : Time,
      @execution_id : String | Nil = nil,
      @execution_type : String | Nil = nil,
    )
    end
  end
end
