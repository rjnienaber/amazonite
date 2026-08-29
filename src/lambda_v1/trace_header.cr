module Amazonite::LambdaV1
  # Contains trace headers for the Lambda durable execution.
  class TraceHeader
    include JSON::Serializable

    # The X-Ray trace header associated with the durable execution.
    @[JSON::Field(key: "XAmznTraceId")]
    property x_amzn_trace_id : String | Nil

    def initialize(
      @x_amzn_trace_id : String | Nil = nil,
    )
    end
  end
end
