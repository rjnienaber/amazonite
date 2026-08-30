module Amazonite::ApiGatewayV1
  # The API request rate limits.
  class ThrottleSettings
    include JSON::Serializable

    # The API target request burst rate limit. This allows more requests through for a period of time
    # than the target rate limit.
    @[JSON::Field(key: "burstLimit")]
    property burst_limit : Int32 | Nil

    # The API target request rate limit.
    @[JSON::Field(key: "rateLimit")]
    property rate_limit : Float64 | Nil

    def initialize(
      @burst_limit : Int32 | Nil = nil,
      @rate_limit : Float64 | Nil = nil,
    )
    end

    def_equals_and_hash(@burst_limit, @rate_limit)
  end
end
