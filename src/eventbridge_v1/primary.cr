private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @health_check
        raise Core::ValidationError.new("HealthCheck length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("HealthCheck length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("HealthCheck does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:route53:::healthcheck/[\\-a-z0-9]+$"))
      end
    end

    def_equals_and_hash(@health_check)
  end
end
