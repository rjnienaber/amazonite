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
  end
end
