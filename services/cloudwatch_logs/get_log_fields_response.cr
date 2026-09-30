private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @log_fields
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@log_fields)
  end
end
