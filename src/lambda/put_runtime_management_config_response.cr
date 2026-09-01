private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @runtime_version_arn
        raise Core::ValidationError.new("RuntimeVersionArn length must be >= 26") if value.size < 26
        raise Core::ValidationError.new("RuntimeVersionArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RuntimeVersionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*):lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}::runtime:.+$"))
      end
    end

    def_equals_and_hash(@update_runtime_on, @function_arn, @runtime_version_arn)
  end
end
