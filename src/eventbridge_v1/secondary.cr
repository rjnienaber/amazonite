private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # The secondary Region that processes events when failover is triggered or replication is enabled.
  class Secondary
    include JSON::Serializable

    # Defines the secondary Region.
    @[JSON::Field(key: "Route")]
    property route : String

    def initialize(
      @route : String,
    )
    end

    def validate! : Nil
      if value = @route
        raise Core::ValidationError.new("Route length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("Route length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("Route does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-z0-9]+$"))
      end
    end

    def_equals_and_hash(@route)
  end
end
