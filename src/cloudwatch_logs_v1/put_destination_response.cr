module Amazonite::CloudWatchLogsV1
  class PutDestinationResponse
    include JSON::Serializable

    # The destination.
    @[JSON::Field(key: "destination")]
    property destination : Destination | Nil

    def initialize(
      @destination : Destination | Nil = nil,
    )
    end

    def_equals_and_hash(@destination)
  end
end
