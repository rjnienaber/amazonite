module Amazonite::LambdaV1
  # Error messages for environment variables that couldn't be applied.
  class EnvironmentError
    include JSON::Serializable

    # The error code.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The error message.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end
  end
end
