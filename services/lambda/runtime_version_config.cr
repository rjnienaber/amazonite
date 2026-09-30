private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The ARN of the runtime and any errors that occured.
  class RuntimeVersionConfig
    include JSON::Serializable

    # The ARN of the runtime version you want the function to use.
    @[JSON::Field(key: "RuntimeVersionArn")]
    property runtime_version_arn : String | Nil

    # Error response when Lambda is unable to retrieve the runtime version for a function.
    @[JSON::Field(key: "Error")]
    property error : RuntimeVersionError | Nil

    def initialize(
      @runtime_version_arn : String | Nil = nil,
      @error : RuntimeVersionError | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @runtime_version_arn
        raise Core::ValidationError.new("RuntimeVersionArn length must be >= 26") if value.size < 26
        raise Core::ValidationError.new("RuntimeVersionArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RuntimeVersionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*):lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}::runtime:.+$"))
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@runtime_version_arn, @error)
  end
end
