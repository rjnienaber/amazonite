module Amazonite::CloudWatchLogsV1
  # Contains the number of log events scanned by the query, the number of log events that matched
  # the query criteria, and the total number of bytes in the log events that were scanned.
  #
  # If the query involved log groups that have field index policies, the estimated number of skipped
  # log events and the total bytes of those skipped log events are included. Using field indexes to
  # skip log events in queries reduces scan volume and improves performance. For more information,
  # see [Create field indexes to improve query performance and reduce scan
  # volume](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html).
  class QueryStatistics
    include JSON::Serializable

    # The number of log events that matched the query string.
    @[JSON::Field(key: "recordsMatched")]
    property records_matched : Float64 | Nil

    # The total number of log events scanned during the query.
    @[JSON::Field(key: "recordsScanned")]
    property records_scanned : Float64 | Nil

    # An estimate of the number of log events that were skipped when processing this query, because
    # the query contained an indexed field. Skipping these entries lowers query costs and improves the
    # query performance time. For more information about field indexes, see
    # [PutIndexPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html).
    @[JSON::Field(key: "estimatedRecordsSkipped")]
    property estimated_records_skipped : Float64 | Nil

    # The total number of bytes in the log events scanned during the query.
    @[JSON::Field(key: "bytesScanned")]
    property bytes_scanned : Float64 | Nil

    # An estimate of the number of bytes in the log events that were skipped when processing this
    # query, because the query contained an indexed field. Skipping these entries lowers query costs
    # and improves the query performance time. For more information about field indexes, see
    # [PutIndexPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html).
    @[JSON::Field(key: "estimatedBytesSkipped")]
    property estimated_bytes_skipped : Float64 | Nil

    # The number of log groups that were scanned by this query.
    @[JSON::Field(key: "logGroupsScanned")]
    property log_groups_scanned : Float64 | Nil

    # The number of rows in the final query result set. This value represents the total number of
    # output rows across all pages. For queries that include post-aggregation filters (such as `stats
    # count(*) by field | filter count > threshold`), this value might be less than `recordsMatched`.
    # It reflects only the rows that survived all operations in the query.
    @[JSON::Field(key: "resultCount")]
    property result_count : Float64 | Nil

    def initialize(
      @records_matched : Float64 | Nil = nil,
      @records_scanned : Float64 | Nil = nil,
      @estimated_records_skipped : Float64 | Nil = nil,
      @bytes_scanned : Float64 | Nil = nil,
      @estimated_bytes_skipped : Float64 | Nil = nil,
      @log_groups_scanned : Float64 | Nil = nil,
      @result_count : Float64 | Nil = nil,
    )
    end
  end
end
