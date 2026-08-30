private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListScheduledQueriesRequest
    include JSON::Serializable

    # The maximum number of scheduled queries to return. Valid range is 1 to 1000.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Filter scheduled queries by state. Valid values are `ENABLED` and `DISABLED`. If not specified,
    # all scheduled queries are returned.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    # Filter scheduled queries by schedule type. Valid values are `CUSTOMER_MANAGED` and
    # `AWS_MANAGED`. If not specified, scheduled queries of all schedule types are returned.
    @[JSON::Field(key: "scheduleType", converter: ACWL::ScheduleType)]
    property schedule_type : ScheduleType | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @state : ScheduledQueryState | Nil = nil,
      @schedule_type : ScheduleType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("maxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("maxResults value must be <= 1000") if value > 1000
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@max_results, @next_token, @state, @schedule_type)
  end
end
