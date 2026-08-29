private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutRuntimeManagementConfigResponse
    include JSON::Serializable

    # The runtime update mode.
    @[JSON::Field(key: "UpdateRuntimeOn", converter: AL::UpdateRuntimeOn)]
    property update_runtime_on : UpdateRuntimeOn

    # The ARN of the function
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    # The ARN of the runtime the function is configured to use. If the runtime update mode is
    # **manual**, the ARN is returned, otherwise `null` is returned.
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
