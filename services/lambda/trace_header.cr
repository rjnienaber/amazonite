private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @x_amzn_trace_id
        raise Core::ValidationError.new("XAmznTraceId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("XAmznTraceId length must be <= 8192") if value.size > 8192
      end
    end

    def_equals_and_hash(@x_amzn_trace_id)
  end
end
