module Amazonite::CloudWatchLogsV1
  class GetLogGroupFieldsResponse
    include JSON::Serializable

    # The array of fields found in the query. Each object in the array contains the name of the field,
    # along with the percentage of time it appeared in the log events that were queried.
    @[JSON::Field(key: "logGroupFields")]
    property log_group_fields : Array(LogGroupField) | Nil

    def initialize(
      @log_group_fields : Array(LogGroupField) | Nil = nil,
    )
    end
  end
end
