module Amazonite::LambdaV1
  class InvokeWithResponseStreamResponseEvent
    include JSON::Serializable

    @[JSON::Field(key: "PayloadChunk")]
    property payload_chunk : InvokeResponseStreamUpdate | Nil

    @[JSON::Field(key: "InvokeComplete")]
    property invoke_complete : InvokeWithResponseStreamCompleteEvent | Nil

    def initialize(
      @payload_chunk : InvokeResponseStreamUpdate | Nil = nil,
      @invoke_complete : InvokeWithResponseStreamCompleteEvent | Nil = nil,
    )
    end
  end
end
