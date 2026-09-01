private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DeleteDestinationRequest
    include JSON::Serializable

    # The name of the destination.
    @[JSON::Field(key: "destinationName")]
    property destination_name : String

    def initialize(
      @destination_name : String,
    )
    end

    def validate! : Nil
      if value = @destination_name
        raise Core::ValidationError.new("destinationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destinationName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("destinationName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end
    end

    def_equals_and_hash(@destination_name)
  end
end
