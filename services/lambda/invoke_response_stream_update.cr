private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
    end

    def_equals_and_hash(@payload)
  end
end
