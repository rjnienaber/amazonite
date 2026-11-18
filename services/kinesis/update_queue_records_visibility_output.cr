private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateQueueRecordsVisibilityOutput
    include JSON::Serializable

    # The records whose visibility timeout was changed.
    @[JSON::Field(key: "Successful")]
    property successful : Array(UpdateQueueRecordsVisibilityResultEntry) = [] of UpdateQueueRecordsVisibilityResultEntry

    # The records whose visibility timeout was not changed, each with the reason the entry failed.
    @[JSON::Field(key: "Failed")]
    property failed : Array(UpdateQueueRecordsVisibilityErrorEntry) = [] of UpdateQueueRecordsVisibilityErrorEntry

    def initialize(
      @successful : Array(UpdateQueueRecordsVisibilityResultEntry),
      @failed : Array(UpdateQueueRecordsVisibilityErrorEntry),
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
