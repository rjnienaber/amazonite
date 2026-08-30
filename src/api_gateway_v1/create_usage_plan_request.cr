module Amazonite::ApiGatewayV1
  # The POST request to create a usage plan with the name, description, throttle limits and quota
  # limits, as well as the associated API stages, specified in the payload.
  class CreateUsagePlanRequest
    include JSON::Serializable

    # The name of the usage plan.
    @[JSON::Field(key: "name")]
    property name : String

    # The description of the usage plan.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The associated API stages of the usage plan.
    @[JSON::Field(key: "apiStages")]
    property api_stages : Array(ApiStage) | Nil

    # The throttling limits of the usage plan.
    @[JSON::Field(key: "throttle")]
    property throttle : ThrottleSettings | Nil

    # The quota of the usage plan.
    @[JSON::Field(key: "quota")]
    property quota : QuotaSettings | Nil

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @name : String,
      @description : String | Nil = nil,
      @api_stages : Array(ApiStage) | Nil = nil,
      @throttle : ThrottleSettings | Nil = nil,
      @quota : QuotaSettings | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @description, @api_stages, @throttle, @quota, @tags)
  end
end
