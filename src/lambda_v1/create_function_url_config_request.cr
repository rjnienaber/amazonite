private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class CreateFunctionUrlConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "AuthType", converter: AL::FunctionUrlAuthType)]
    property auth_type : FunctionUrlAuthType

    @[JSON::Field(key: "Cors")]
    property cors : Cors | Nil

    @[JSON::Field(key: "InvokeMode", converter: AL::InvokeMode)]
    property invoke_mode : InvokeMode | Nil

    def initialize(
      @function_name : String,
      @auth_type : FunctionUrlAuthType,
      @qualifier : String | Nil = nil,
      @cors : Cors | Nil = nil,
      @invoke_mode : InvokeMode | Nil = nil,
    )
    end
  end
end
