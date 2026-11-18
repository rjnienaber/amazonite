private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class AcknowledgeQueueRecordsOutput
    include JSON::Serializable

    # The records that were acknowledged.
    @[JSON::Field(key: "Successful")]
    property successful : Array(AcknowledgeQueueRecordsResultEntry) = [] of AcknowledgeQueueRecordsResultEntry

    # The records that were not acknowledged, each with the reason the entry failed.
    @[JSON::Field(key: "Failed")]
    property failed : Array(AcknowledgeQueueRecordsErrorEntry) = [] of AcknowledgeQueueRecordsErrorEntry

    def initialize(
      @successful : Array(AcknowledgeQueueRecordsResultEntry),
      @failed : Array(AcknowledgeQueueRecordsErrorEntry),
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
