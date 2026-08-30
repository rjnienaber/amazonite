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
  end
end
