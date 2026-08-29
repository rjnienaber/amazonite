private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class InvokeResponseStreamUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Payload", converter: Core::Base64Converter)]
    property payload : Bytes | Nil

    def initialize(
      @payload : Bytes | Nil = nil,
    )
    end
  end
end
