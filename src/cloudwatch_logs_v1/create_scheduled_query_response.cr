private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class CreateScheduledQueryResponse
    include JSON::Serializable

    # The ARN of the created scheduled query.
    @[JSON::Field(key: "scheduledQueryArn")]
    property scheduled_query_arn : String | Nil

    # The current state of the scheduled query.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    def initialize(
      @scheduled_query_arn : String | Nil = nil,
      @state : ScheduledQueryState | Nil = nil,
    )
    end
  end
end
