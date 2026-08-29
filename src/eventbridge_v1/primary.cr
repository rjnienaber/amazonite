module Amazonite::EventBridgeV1
  # The primary Region of the endpoint.
  class Primary
    include JSON::Serializable

    # The ARN of the health check used by the endpoint to determine whether failover is triggered.
    @[JSON::Field(key: "HealthCheck")]
    property health_check : String

    def initialize(
      @health_check : String,
    )
    end
  end
end
