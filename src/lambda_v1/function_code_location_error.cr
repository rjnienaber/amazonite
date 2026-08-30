module Amazonite::LambdaV1
  # Contains details about an error that occurred when Lambda attempted to retrieve a function's
  # deployment package.
  class FunctionCodeLocationError
    include JSON::Serializable

    # The error code that identifies why Lambda failed to retrieve the deployment package.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The human-readable message that describes why Lambda failed to retrieve the deployment package.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def_equals_and_hash(@error_code, @message)
  end
end
