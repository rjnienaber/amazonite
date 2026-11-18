private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ReceiveDeadLetterQueueRecordsOutput
    include JSON::Serializable

    # The dead-letter records received from the queue. This list is empty when no dead-letter records
    # are visible.
    @[JSON::Field(key: "QueueRecords")]
    property queue_records : Array(QueueRecord) = [] of QueueRecord

    def initialize(
      @queue_records : Array(QueueRecord),
    )
    end

    def validate! : Nil
      if value = @queue_records
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@queue_records)
  end
end
