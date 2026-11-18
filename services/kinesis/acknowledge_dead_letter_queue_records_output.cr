private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class AcknowledgeDeadLetterQueueRecordsOutput
    include JSON::Serializable

    # The records that were acknowledged.
    @[JSON::Field(key: "Successful")]
    property successful : Array(AcknowledgeDeadLetterQueueRecordsResultEntry) = [] of AcknowledgeDeadLetterQueueRecordsResultEntry

    # The records that were not acknowledged, each with the reason the entry failed.
    @[JSON::Field(key: "Failed")]
    property failed : Array(AcknowledgeDeadLetterQueueRecordsErrorEntry) = [] of AcknowledgeDeadLetterQueueRecordsErrorEntry

    def initialize(
      @successful : Array(AcknowledgeDeadLetterQueueRecordsResultEntry),
      @failed : Array(AcknowledgeDeadLetterQueueRecordsErrorEntry),
    )
    end

    def validate! : Nil
      if value = @successful
        value.each(&.validate!)
      end

      if value = @failed
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful, @failed)
  end
end
