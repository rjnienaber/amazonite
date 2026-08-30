module Amazonite::CloudWatchLogsV1
  class DescribeDestinationsResponse
    include JSON::Serializable

    # The destinations.
    @[JSON::Field(key: "destinations")]
    property destinations : Array(Destination) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @destinations : Array(Destination) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@destinations, @next_token)
  end
end
