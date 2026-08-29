private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class GetRuntimeManagementConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "UpdateRuntimeOn", converter: AL::UpdateRuntimeOn)]
    property update_runtime_on : UpdateRuntimeOn | Nil

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    @[JSON::Field(key: "RuntimeVersionArn")]
    property runtime_version_arn : String | Nil

    def initialize(
      @update_runtime_on : UpdateRuntimeOn | Nil = nil,
      @function_arn : String | Nil = nil,
      @runtime_version_arn : String | Nil = nil,
    )
    end
  end
end
