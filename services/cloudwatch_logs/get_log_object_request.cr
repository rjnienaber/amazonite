private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # The parameters for the GetLogObject operation.
  class GetLogObjectRequest
    include JSON::Serializable

    # A boolean flag that indicates whether to unmask sensitive log data. When set to true, any masked
    # or redacted data in the log object will be displayed in its original form. Default is false.
    @[JSON::Field(key: "unmask")]
    property unmask : Bool | Nil

    # A pointer to the specific log object to retrieve. This is a required parameter that uniquely
    # identifies the log object within CloudWatch Logs. The pointer is typically obtained from a
    # previous query or filter operation.
    @[JSON::Field(key: "logObjectPointer")]
    property log_object_pointer : String

    def initialize(
      @log_object_pointer : String,
      @unmask : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_object_pointer
        raise Core::ValidationError.new("logObjectPointer length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logObjectPointer length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@unmask, @log_object_pointer)
  end
end
