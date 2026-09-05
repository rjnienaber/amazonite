private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The range of possible hash key values for the shard, which is a set of ordered contiguous
  # positive integers.
  class HashKeyRange
    include JSON::Serializable

    # The starting hash key of the hash key range.
    @[JSON::Field(key: "StartingHashKey")]
    property starting_hash_key : String

    # The ending hash key of the hash key range.
    @[JSON::Field(key: "EndingHashKey")]
    property ending_hash_key : String

    def initialize(
      @starting_hash_key : String,
      @ending_hash_key : String,
    )
    end

    def validate! : Nil
      if value = @starting_hash_key
        raise Core::ValidationError.new("StartingHashKey does not match the required pattern") unless value.matches?(Regex.new("^(0|([1-9]\\d{0,38}))$"))
      end

      if value = @ending_hash_key
        raise Core::ValidationError.new("EndingHashKey does not match the required pattern") unless value.matches?(Regex.new("^(0|([1-9]\\d{0,38}))$"))
      end
    end

    def_equals_and_hash(@starting_hash_key, @ending_hash_key)
  end
end
