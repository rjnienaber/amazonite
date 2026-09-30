private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @starting_sequence_number
        raise Core::ValidationError.new("StartingSequenceNumber does not match the required pattern") unless value.matches?(Regex.new("^(0|([1-9]\\d{0,128}))$"))
      end

      if value = @ending_sequence_number
        raise Core::ValidationError.new("EndingSequenceNumber does not match the required pattern") unless value.matches?(Regex.new("^(0|([1-9]\\d{0,128}))$"))
      end
    end

    def_equals_and_hash(@starting_sequence_number, @ending_sequence_number)
  end
end
