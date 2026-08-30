private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListAggregateLogGroupSummariesResponse
    include JSON::Serializable

    # The list of aggregate log group summaries grouped by the specified data source characteristics.
    @[JSON::Field(key: "aggregateLogGroupSummaries")]
    property aggregate_log_group_summaries : Array(AggregateLogGroupSummary) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @aggregate_log_group_summaries : Array(AggregateLogGroupSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @aggregate_log_group_summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@aggregate_log_group_summaries, @next_token)
  end
end
