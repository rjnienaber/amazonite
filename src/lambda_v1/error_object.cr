module Amazonite::LambdaV1
  class ErrorObject
    include JSON::Serializable

    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    @[JSON::Field(key: "ErrorType")]
    property error_type : String | Nil

    @[JSON::Field(key: "ErrorData")]
    property error_data : String | Nil

    @[JSON::Field(key: "StackTrace")]
    property stack_trace : Array(String) | Nil

    def initialize(
      @error_message : String | Nil = nil,
      @error_type : String | Nil = nil,
      @error_data : String | Nil = nil,
      @stack_trace : Array(String) | Nil = nil,
    )
    end
  end
end
