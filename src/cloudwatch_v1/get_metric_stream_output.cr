private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricStreamOutput
    include JSON::Serializable

    # The ARN of the metric stream.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The name of the metric stream.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # If this array of metric namespaces is present, then these namespaces are the only metric
    # namespaces that are streamed by this metric stream.
    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(MetricStreamFilter) | Nil

    # If this array of metric namespaces is present, then these namespaces are the only metric
    # namespaces that are not streamed by this metric stream. In this case, all other metric
    # namespaces in the account are streamed by this metric stream.
    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(MetricStreamFilter) | Nil

    # The ARN of the Amazon Kinesis Data Firehose delivery stream that is used by this metric stream.
    @[JSON::Field(key: "FirehoseArn")]
    property firehose_arn : String | Nil

    # The ARN of the IAM role that is used by this metric stream.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The state of the metric stream. The possible values are `running` and `stopped`.
    @[JSON::Field(key: "State")]
    property state : String | Nil

    # The date that the metric stream was created.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    # The date of the most recent update to the metric stream's configuration.
    @[JSON::Field(key: "LastUpdateDate", converter: Core::AWSEpochConverter)]
    property last_update_date : Time | Nil

    # The output format for the stream. Valid values are `json`, `opentelemetry1.0`, and
    # `opentelemetry0.7`. For more information about metric stream output formats, see [Metric streams
    # output
    # formats](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-metric-streams-formats.html).
    @[JSON::Field(key: "OutputFormat", converter: ACW::MetricStreamOutputFormat)]
    property output_format : MetricStreamOutputFormat | Nil

    # Each entry in this array displays information about one or more metrics that include additional
    # statistics in the metric stream. For more information about the additional statistics, see [
    # CloudWatch statistics
    # definitions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html).
    @[JSON::Field(key: "StatisticsConfigurations")]
    property statistics_configurations : Array(MetricStreamStatisticsConfiguration) | Nil

    # If this is `true` and this metric stream is in a monitoring account, then the stream includes
    # metrics from source accounts that the monitoring account is linked to.
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

    def_equals_and_hash(@arn, @name, @include_filters, @exclude_filters, @firehose_arn, @role_arn, @state, @creation_date, @last_update_date, @output_format, @statistics_configurations, @include_linked_accounts_metrics)
  end
end
