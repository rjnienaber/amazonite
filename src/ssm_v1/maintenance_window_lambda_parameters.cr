module Amazonite::SsmV1
  class MaintenanceWindowLambdaParameters
    include JSON::Serializable

    @[JSON::Field(key: "ClientContext")]
    property client_context : String | Nil

    @[JSON::Field(key: "Qualifier")]
    property qualifier : String | Nil

    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    def initialize(
      @client_context : String | Nil = nil,
      @qualifier : String | Nil = nil,
      @payload : String | Nil = nil
    )
    end
  end
end
