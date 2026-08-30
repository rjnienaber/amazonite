module Amazonite::LambdaV1
  # An object that contains error information.
  class ErrorObject
    include JSON::Serializable

    # A human-readable error message.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    # The error type.
    @[JSON::Field(key: "ErrorType")]
    property error_type : String | Nil

    # Machine-readable error data.
    @[JSON::Field(key: "ErrorData")]
    property error_data : String | Nil

    # Stack trace information for the error.
    @[JSON::Field(key: "StackTrace")]
    property stack_trace : Array(String) | Nil

    def initialize(
      @error_message : String | Nil = nil,
      @error_type : String | Nil = nil,
      @error_data : String | Nil = nil,
      @stack_trace : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@error_message, @error_type, @error_data, @stack_trace)
  end
end
