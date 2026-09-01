private alias Core = Amazonite::Core

module Amazonite::Lambda
  class PutProvisionedConcurrencyConfigRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function`.
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** – `123456789012:function:my-function`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # The version number or alias name.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    # The amount of provisioned concurrency to allocate for the version or alias.
    @[JSON::Field(key: "ProvisionedConcurrentExecutions")]
    property provisioned_concurrent_executions : Int32

    def initialize(
      @function_name : String,
      @qualifier : String,
      @provisioned_concurrent_executions : Int32,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^(|[a-zA-Z0-9$_-]+)$"))
      end

      if value = @provisioned_concurrent_executions
        raise Core::ValidationError.new("ProvisionedConcurrentExecutions value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@function_name, @qualifier, @provisioned_concurrent_executions)
  end
end
