private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class PutMetricStreamInput
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(MetricStreamFilter) | Nil

    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(MetricStreamFilter) | Nil

    @[JSON::Field(key: "FirehoseArn")]
    property firehose_arn : String

    @[JSON::Field(key: "RoleArn")]
    property role_arn : String

    @[JSON::Field(key: "OutputFormat", converter: ACW::MetricStreamOutputFormat)]
    property output_format : MetricStreamOutputFormat

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "StatisticsConfigurations")]
    property statistics_configurations : Array(MetricStreamStatisticsConfiguration) | Nil

    @[JSON::Field(key: "IncludeLinkedAccountsMetrics")]
    property include_linked_accounts_metrics : Bool | Nil

    def initialize(
      @name : String,
      @firehose_arn : String,
      @role_arn : String,
      @output_format : MetricStreamOutputFormat,
      @include_filters : Array(MetricStreamFilter) | Nil = nil,
      @exclude_filters : Array(MetricStreamFilter) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @statistics_configurations : Array(MetricStreamStatisticsConfiguration) | Nil = nil,
      @include_linked_accounts_metrics : Bool | Nil = nil,
    )
    end
  end
end
