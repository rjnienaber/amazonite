private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
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
  end
end
