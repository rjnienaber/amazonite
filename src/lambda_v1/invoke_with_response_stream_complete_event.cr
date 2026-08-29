module Amazonite::LambdaV1
  class InvokeWithResponseStreamCompleteEvent
    include JSON::Serializable

    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    @[JSON::Field(key: "ErrorDetails")]
    property error_details : String | Nil

    @[JSON::Field(key: "LogResult")]
    property log_result : String | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @error_details : String | Nil = nil,
      @log_result : String | Nil = nil,
    )
    end
  end
end
