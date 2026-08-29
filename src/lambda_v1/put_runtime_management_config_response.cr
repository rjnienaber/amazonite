private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutRuntimeManagementConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "UpdateRuntimeOn", converter: AL::UpdateRuntimeOn)]
    property update_runtime_on : UpdateRuntimeOn

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    @[JSON::Field(key: "RuntimeVersionArn")]
    property runtime_version_arn : String | Nil

    def initialize(
      @update_runtime_on : UpdateRuntimeOn,
      @function_arn : String,
      @runtime_version_arn : String | Nil = nil,
    )
    end
  end
end
