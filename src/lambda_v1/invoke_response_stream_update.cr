private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # A chunk of the streamed response payload.
  class InvokeResponseStreamUpdate
    include JSON::Serializable

    # Data returned by your Lambda function.
    @[JSON::Field(key: "Payload", converter: Core::Base64Converter)]
    property payload : Bytes | Nil

    def initialize(
      @payload : Bytes | Nil = nil,
    )
    end
  end
end
