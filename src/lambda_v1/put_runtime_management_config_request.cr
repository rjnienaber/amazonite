private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutRuntimeManagementConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "UpdateRuntimeOn", converter: AL::UpdateRuntimeOn)]
    property update_runtime_on : UpdateRuntimeOn

    @[JSON::Field(key: "RuntimeVersionArn")]
    property runtime_version_arn : String | Nil

    def initialize(
      @function_name : String,
      @update_runtime_on : UpdateRuntimeOn,
      @qualifier : String | Nil = nil,
      @runtime_version_arn : String | Nil = nil,
    )
    end
  end
end
