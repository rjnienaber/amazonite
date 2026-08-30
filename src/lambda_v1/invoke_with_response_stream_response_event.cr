module Amazonite::LambdaV1
  # An object that includes a chunk of the response payload. When the stream has ended, Lambda
  # includes a `InvokeComplete` object.
  class InvokeWithResponseStreamResponseEvent
    include JSON::Serializable

    # A chunk of the streamed response payload.
    @[JSON::Field(key: "PayloadChunk")]
    property payload_chunk : InvokeResponseStreamUpdate | Nil

    # An object that's returned when the stream has ended and all the payload chunks have been
    # returned.
    @[JSON::Field(key: "InvokeComplete")]
    property invoke_complete : InvokeWithResponseStreamCompleteEvent | Nil

    def initialize(
      @payload_chunk : InvokeResponseStreamUpdate | Nil = nil,
      @invoke_complete : InvokeWithResponseStreamCompleteEvent | Nil = nil,
    )
    end

    def_equals_and_hash(@payload_chunk, @invoke_complete)
  end
end
