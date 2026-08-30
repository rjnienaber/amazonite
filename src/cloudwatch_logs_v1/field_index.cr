private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This structure describes one log event field that is used as an index in at least one index
  # policy in this account.
  class FieldIndex
    include JSON::Serializable

    # If this field index appears in an index policy that applies only to a single log group, the ARN
    # of that log group is displayed here.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The string that this field index matches.
    @[JSON::Field(key: "fieldIndexName")]
    property field_index_name : String | Nil

    # The most recent time that CloudWatch Logs scanned ingested log events to search for this field
    # index to improve the speed of future CloudWatch Logs Insights queries that search for this field
    # index.
    @[JSON::Field(key: "lastScanTime")]
    property last_scan_time : Int64 | Nil

    # The time and date of the earliest log event that matches this field index, after the index
    # policy that contains it was created.
    @[JSON::Field(key: "firstEventTime")]
    property first_event_time : Int64 | Nil

    # The time and date of the most recent log event that matches this field index.
    @[JSON::Field(key: "lastEventTime")]
    property last_event_time : Int64 | Nil

    # The type of index. Specify `FACET` for facet-based indexing or `FIELD_INDEX` for field-based
    # indexing. This determines how the field is indexed and can be queried.
    @[JSON::Field(key: "type", converter: ACWL::IndexType)]
    property type : IndexType | Nil

    # The category of the field index:
    #
    # - `DEFAULT`: Fields that CloudWatch Logs indexes by default. Examples include `@logStream` and
    # `@data_format`.
    #
    # - `CUSTOM`: Fields that you added manually to the field index policy. CloudWatch Logs always
    # indexes these fields. These fields count toward the quota of 20 fields for each log group.
    #
    # - `AUTO`: Fields that CloudWatch Logs indexes automatically based on your query patterns and
    # usage. These fields do not count toward the field index quota. CloudWatch Logs might update
    # these fields based on changes in your query patterns. To keep a field indexed permanently, add
    # it to an account-level or log-group level field index policy.
    #
    # - `INACTIVE`: Fields that CloudWatch Logs indexed before but does not index now. This happens if
    # you remove a field from the field index policy or if CloudWatch Logs automatically selects a
    # different field based on your queries.
    #
    # For more information about automatically indexed fields, see [Automatically indexed
    # fields](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Automatic.html).
    @[JSON::Field(key: "indexCategory", converter: ACWL::IndexCategory)]
    property index_category : IndexCategory | Nil

    def initialize(
      @log_group_identifier : String | Nil = nil,
      @field_index_name : String | Nil = nil,
      @last_scan_time : Int64 | Nil = nil,
      @first_event_time : Int64 | Nil = nil,
      @last_event_time : Int64 | Nil = nil,
      @type : IndexType | Nil = nil,
      @index_category : IndexCategory | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_identifier, @field_index_name, @last_scan_time, @first_event_time, @last_event_time, @type, @index_category)
  end
end
