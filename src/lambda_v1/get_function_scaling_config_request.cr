private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetFunctionScalingConfigRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # Specify a version or alias to get the scaling configuration for a published version of the
    # function.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    def initialize(
      @function_name : String,
      @qualifier : String,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^(\\$LATEST\\.PUBLISHED|[0-9]+)$"))
      end
    end

    def_equals_and_hash(@function_name, @qualifier)
  end
end
