private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @destinations
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@destinations, @next_token)
  end
end
