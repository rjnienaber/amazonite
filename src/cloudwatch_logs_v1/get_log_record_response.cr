module Amazonite::CloudWatchLogsV1
  class GetLogRecordResponse
    include JSON::Serializable

    # The requested log event, as a JSON string.
    @[JSON::Field(key: "logRecord")]
    property log_record : Hash(String, String) | Nil

    def initialize(
      @log_record : Hash(String, String) | Nil = nil,
    )
    end
  end
end
