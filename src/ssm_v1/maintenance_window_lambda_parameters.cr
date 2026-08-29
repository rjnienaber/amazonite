private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class MaintenanceWindowLambdaParameters
    include JSON::Serializable

    @[JSON::Field(key: "ClientContext")]
    property client_context : String | Nil

    @[JSON::Field(key: "Qualifier")]
    property qualifier : String | Nil

    @[JSON::Field(key: "Payload", converter: Core::Base64Converter)]
    property payload : Bytes | Nil

    def initialize(
      @client_context : String | Nil = nil,
      @qualifier : String | Nil = nil,
      @payload : Bytes | Nil = nil,
    )
    end
  end
end
