module Amazonite::CloudWatchLogsV1
  class GetScheduledQueryHistoryResponse
    include JSON::Serializable

    # The name of the scheduled query.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The ARN of the scheduled query.
    @[JSON::Field(key: "scheduledQueryArn")]
    property scheduled_query_arn : String | Nil

    # An array of execution history records for the scheduled query.
    @[JSON::Field(key: "triggerHistory")]
    property trigger_history : Array(TriggerHistoryRecord) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @scheduled_query_arn : String | Nil = nil,
      @trigger_history : Array(TriggerHistoryRecord) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @scheduled_query_arn, @trigger_history, @next_token)
  end
end
