private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class GetRuntimeManagementConfigResponse
    include JSON::Serializable

    # The current runtime update mode of the function.
    @[JSON::Field(key: "UpdateRuntimeOn", converter: AL::UpdateRuntimeOn)]
    property update_runtime_on : UpdateRuntimeOn | Nil

    # The Amazon Resource Name (ARN) of your function.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    # The ARN of the runtime the function is configured to use. If the runtime update mode is
    # **Manual**, the ARN is returned, otherwise `null` is returned.
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
