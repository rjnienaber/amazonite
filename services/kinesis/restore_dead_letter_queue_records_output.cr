private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class RestoreDeadLetterQueueRecordsOutput
    include JSON::Serializable

    # The records that were restored.
    @[JSON::Field(key: "Successful")]
    property successful : Array(RestoreDeadLetterQueueRecordsResultEntry) = [] of RestoreDeadLetterQueueRecordsResultEntry

    # The records that were not restored, each with the reason the entry failed.
    @[JSON::Field(key: "Failed")]
    property failed : Array(RestoreDeadLetterQueueRecordsErrorEntry) = [] of RestoreDeadLetterQueueRecordsErrorEntry

    def initialize(
      @successful : Array(RestoreDeadLetterQueueRecordsResultEntry),
      @failed : Array(RestoreDeadLetterQueueRecordsErrorEntry),
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
