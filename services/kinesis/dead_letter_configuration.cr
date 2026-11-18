private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The dead-letter handling configuration for a queue. Each queue has built-in dead-letter
  # handling. When a record has been received `MaxReceiveCount` times without being acknowledged, it
  # becomes a dead-letter record, and ReceiveQueueRecords no longer returns it. The dead-letter
  # record stays in the same queue, and you work with it through ReceiveDeadLetterQueueRecords,
  # AcknowledgeDeadLetterQueueRecords, UpdateDeadLetterQueueRecordsVisibility, and
  # RestoreDeadLetterQueueRecords, which use the same queue ARN.
  #
  # Dead-letter handling is enabled by default, with a `MaxReceiveCount` of 6. To use a different
  # value, or to turn dead-letter handling off, specify this configuration in `QueueAttributes`.
  class DeadLetterConfiguration
    include JSON::Serializable

    # Whether dead-letter handling is enabled for the queue. `BUILT_IN` enables it: when a record has
    # been received `MaxReceiveCount` times without being acknowledged, it becomes a dead-letter
    # record and ReceiveQueueRecords no longer returns it. `NONE` disables it, and an unacknowledged
    # record continues to be redelivered until it is acknowledged or its retention period ends.
    @[JSON::Field(key: "TargetType", converter: AK::TargetType)]
    property target_type : TargetType

    # The number of times a record can be received without being acknowledged before it becomes a
    # dead-letter record. Required when `TargetType` is `BUILT_IN`. A queue that you create without
    # `DeadLetterConfiguration` gets a `MaxReceiveCount` of 6.
    @[JSON::Field(key: "MaxReceiveCount")]
    property max_receive_count : Int32 | Nil

    def initialize(
      @target_type : TargetType,
      @max_receive_count : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_receive_count
        raise Core::ValidationError.new("MaxReceiveCount value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxReceiveCount value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@target_type, @max_receive_count)
  end
end
