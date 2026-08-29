private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class PutMetricStreamInput
    include JSON::Serializable

    # If you are creating a new metric stream, this is the name for the new stream. The name must be
    # different than the names of other metric streams in this account and Region.
    #
    # If you are updating a metric stream, specify the name of that stream here.
    #
    # Valid characters are A-Z, a-z, 0-9, "-" and "_".
    @[JSON::Field(key: "Name")]
    property name : String

    # If you specify this parameter, the stream sends only the metrics from the metric namespaces that
    # you specify here.
    #
    # You cannot include `IncludeFilters` and `ExcludeFilters` in the same operation.
    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(MetricStreamFilter) | Nil

    # If you specify this parameter, the stream sends metrics from all metric namespaces except for
    # the namespaces that you specify here.
    #
    # You cannot include `ExcludeFilters` and `IncludeFilters` in the same operation.
    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(MetricStreamFilter) | Nil

    # The ARN of the Amazon Kinesis Data Firehose delivery stream to use for this metric stream. This
    # Amazon Kinesis Data Firehose delivery stream must already exist and must be in the same account
    # as the metric stream.
    @[JSON::Field(key: "FirehoseArn")]
    property firehose_arn : String

    # The ARN of an IAM role that this metric stream will use to access Amazon Kinesis Data Firehose
    # resources. This IAM role must already exist and must be in the same account as the metric
    # stream. This IAM role must include the following permissions:
    #
    # - firehose:PutRecord
    #
    # - firehose:PutRecordBatch
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String

    # The output format for the stream. Valid values are `json`, `opentelemetry1.0`, and
    # `opentelemetry0.7`. For more information about metric stream output formats, see [ Metric
    # streams output
    # formats](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-metric-streams-formats.html).
    @[JSON::Field(key: "OutputFormat", converter: ACW::MetricStreamOutputFormat)]
    property output_format : MetricStreamOutputFormat

    # A list of key-value pairs to associate with the metric stream. You can associate as many as 50
    # tags with a metric stream.
    #
    # Tags can help you organize and categorize your resources. You can also use them to scope user
    # permissions by granting a user permission to access or change only resources with certain tag
    # values.
    #
    # You can use this parameter only when you are creating a new metric stream. If you are using this
    # operation to update an existing metric stream, any tags you specify in this parameter are
    # ignored. To change the tags of an existing metric stream, use
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html)
    # or
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # By default, a metric stream always sends the `MAX`, `MIN`, `SUM`, and `SAMPLECOUNT` statistics
    # for each metric that is streamed. You can use this parameter to have the metric stream also send
    # additional statistics in the stream. This array can have up to 100 members.
    #
    # For each entry in this array, you specify one or more metrics and the list of additional
    # statistics to stream for those metrics. The additional statistics that you can stream depend on
    # the stream's `OutputFormat`. If the `OutputFormat` is `json`, you can stream any additional
    # statistic that is supported by CloudWatch, listed in [ CloudWatch statistics
    # definitions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html).
    # If the `OutputFormat` is `opentelemetry1.0` or `opentelemetry0.7`, you can stream percentile
    # statistics such as p95, p99.9, and so on.
    @[JSON::Field(key: "StatisticsConfigurations")]
    property statistics_configurations : Array(MetricStreamStatisticsConfiguration) | Nil

    # If you are creating a metric stream in a monitoring account, specify `true` to include metrics
    # from source accounts in the metric stream.
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
