private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class InvokeWithResponseStreamRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "LogType", converter: AL::LogType, ignore: true)]
    property log_type : LogType | Nil

    @[JSON::Field(key: "ClientContext", ignore: true)]
    property client_context : String | Nil

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    @[JSON::Field(key: "TenantId", ignore: true)]
    property tenant_id : String | Nil

    @[JSON::Field(key: "InvocationType", converter: AL::ResponseStreamingInvocationType, ignore: true)]
    property invocation_type : ResponseStreamingInvocationType | Nil

    def initialize(
      @function_name : String,
      @log_type : LogType | Nil = nil,
      @client_context : String | Nil = nil,
      @qualifier : String | Nil = nil,
      @payload : String | Nil = nil,
      @tenant_id : String | Nil = nil,
      @invocation_type : ResponseStreamingInvocationType | Nil = nil,
    )
    end
  end
end
