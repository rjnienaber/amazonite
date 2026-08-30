module Amazonite::CloudWatchLogsV1
  class GetLogFieldsResponse
    include JSON::Serializable

    # The list of log fields for the specified data source, including field names and their data
    # types.
    @[JSON::Field(key: "logFields")]
    property log_fields : Array(LogFieldsListItem) | Nil

    def initialize(
      @log_fields : Array(LogFieldsListItem) | Nil = nil,
    )
    end
  end
end
