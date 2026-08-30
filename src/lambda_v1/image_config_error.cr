module Amazonite::LambdaV1
  # Error response to `GetFunctionConfiguration`.
  class ImageConfigError
    include JSON::Serializable

    # Error code.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # Error message.
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
