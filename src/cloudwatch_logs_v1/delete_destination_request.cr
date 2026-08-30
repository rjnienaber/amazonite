module Amazonite::CloudWatchLogsV1
  class DeleteDestinationRequest
    include JSON::Serializable

    # The name of the destination.
    @[JSON::Field(key: "destinationName")]
    property destination_name : String

    def initialize(
      @destination_name : String,
    )
    end
  end
end
