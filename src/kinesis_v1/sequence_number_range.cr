module Amazonite::KinesisV1
  # The range of possible sequence numbers for the shard.
  class SequenceNumberRange
    include JSON::Serializable

    # The starting sequence number for the range.
    @[JSON::Field(key: "StartingSequenceNumber")]
    property starting_sequence_number : String

    # The ending sequence number for the range. Shards that are in the OPEN state have an ending
    # sequence number of `null`.
    @[JSON::Field(key: "EndingSequenceNumber")]
    property ending_sequence_number : String | Nil

    def initialize(
      @starting_sequence_number : String,
      @ending_sequence_number : String | Nil = nil,
    )
    end
  end
end
