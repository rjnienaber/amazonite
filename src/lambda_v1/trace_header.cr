module Amazonite::LambdaV1
  class TraceHeader
    include JSON::Serializable

    @[JSON::Field(key: "XAmznTraceId")]
    property x_amzn_trace_id : String | Nil

    def initialize(
      @x_amzn_trace_id : String | Nil = nil,
    )
    end
  end
end
