private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricStreamOutput
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(MetricStreamFilter) | Nil

    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(MetricStreamFilter) | Nil

    @[JSON::Field(key: "FirehoseArn")]
    property firehose_arn : String | Nil

    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    @[JSON::Field(key: "State")]
    property state : String | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    @[JSON::Field(key: "LastUpdateDate", converter: Core::AWSEpochConverter)]
    property last_update_date : Time | Nil

    @[JSON::Field(key: "OutputFormat", converter: ACW::MetricStreamOutputFormat)]
    property output_format : MetricStreamOutputFormat | Nil

    @[JSON::Field(key: "StatisticsConfigurations")]
    property statistics_configurations : Array(MetricStreamStatisticsConfiguration) | Nil

    @[JSON::Field(key: "IncludeLinkedAccountsMetrics")]
    property include_linked_accounts_metrics : Bool | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @include_filters : Array(MetricStreamFilter) | Nil = nil,
      @exclude_filters : Array(MetricStreamFilter) | Nil = nil,
      @firehose_arn : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @state : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @last_update_date : Time | Nil = nil,
      @output_format : MetricStreamOutputFormat | Nil = nil,
      @statistics_configurations : Array(MetricStreamStatisticsConfiguration) | Nil = nil,
      @include_linked_accounts_metrics : Bool | Nil = nil,
    )
    end
  end
end
