module Amazonite::ApiGatewayV1
  # API stage name of the associated API stage in a usage plan.
  class ApiStage
    include JSON::Serializable

    # API Id of the associated API stage in a usage plan.
    @[JSON::Field(key: "apiId")]
    property api_id : String | Nil

    # API stage name of the associated API stage in a usage plan.
    @[JSON::Field(key: "stage")]
    property stage : String | Nil

    # Map containing method level throttling information for API stage in a usage plan.
    @[JSON::Field(key: "throttle")]
    property throttle : Hash(String, ThrottleSettings) | Nil

    def initialize(
      @api_id : String | Nil = nil,
      @stage : String | Nil = nil,
      @throttle : Hash(String, ThrottleSettings) | Nil = nil,
    )
    end

    def_equals_and_hash(@api_id, @stage, @throttle)
  end
end
