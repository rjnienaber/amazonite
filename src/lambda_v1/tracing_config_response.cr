private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class TracingConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "Mode", converter: AL::TracingMode)]
    property mode : TracingMode | Nil

    def initialize(
      @mode : TracingMode | Nil = nil,
    )
    end
  end
end
