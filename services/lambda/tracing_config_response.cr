private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  # The function's X-Ray tracing configuration.
  class TracingConfigResponse
    include JSON::Serializable

    # The tracing mode.
    @[JSON::Field(key: "Mode", converter: AL::TracingMode)]
    property mode : TracingMode | Nil

    def initialize(
      @mode : TracingMode | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@mode)
  end
end
