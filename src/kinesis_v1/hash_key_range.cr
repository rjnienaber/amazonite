module Amazonite::KinesisV1
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
  end
end
