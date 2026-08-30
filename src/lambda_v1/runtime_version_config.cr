module Amazonite::LambdaV1
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
  end
end
