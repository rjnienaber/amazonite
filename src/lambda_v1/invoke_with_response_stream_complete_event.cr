module Amazonite::LambdaV1
  # A response confirming that the event stream is complete.
  class InvokeWithResponseStreamCompleteEvent
    include JSON::Serializable

    # An error code.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The details of any returned error.
    @[JSON::Field(key: "ErrorDetails")]
    property error_details : String | Nil

    # The last 4 KB of the execution log, which is base64-encoded.
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
