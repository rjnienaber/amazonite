private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class CreateFunctionUrlConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "FunctionUrl")]
    property function_url : String

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    @[JSON::Field(key: "AuthType", converter: AL::FunctionUrlAuthType)]
    property auth_type : FunctionUrlAuthType

    @[JSON::Field(key: "Cors")]
    property cors : Cors | Nil

    @[JSON::Field(key: "CreationTime")]
    property creation_time : String

    @[JSON::Field(key: "InvokeMode", converter: AL::InvokeMode)]
    property invoke_mode : InvokeMode | Nil

    def initialize(
      @function_url : String,
      @function_arn : String,
      @auth_type : FunctionUrlAuthType,
      @creation_time : String,
      @cors : Cors | Nil = nil,
      @invoke_mode : InvokeMode | Nil = nil,
    )
    end
  end
end
