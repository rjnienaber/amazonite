private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # This structure contains the configuration information about one metric stream.
  class MetricStreamEntry
    include JSON::Serializable

    # The ARN of the metric stream.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The date that the metric stream was originally created.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    # The date that the configuration of this metric stream was most recently updated.
    @[JSON::Field(key: "LastUpdateDate", converter: Core::AWSEpochConverter)]
    property last_update_date : Time | Nil

    # The name of the metric stream.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The ARN of the Kinesis Firehose devlivery stream that is used for this metric stream.
    @[JSON::Field(key: "FirehoseArn")]
    property firehose_arn : String | Nil

    # The current state of this stream. Valid values are `running` and `stopped`.
    @[JSON::Field(key: "State")]
    property state : String | Nil

    # The output format of this metric stream. Valid values are `json`, `opentelemetry1.0`, and
    # `opentelemetry0.7`.
    @[JSON::Field(key: "OutputFormat", converter: ACW::MetricStreamOutputFormat)]
    property output_format : MetricStreamOutputFormat | Nil

    def initialize(
      @arn : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @last_update_date : Time | Nil = nil,
      @name : String | Nil = nil,
      @firehose_arn : String | Nil = nil,
      @state : String | Nil = nil,
      @output_format : MetricStreamOutputFormat | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 255") if value.size > 255
      end

      if value = @firehose_arn
        raise Core::ValidationError.new("FirehoseArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FirehoseArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@arn, @creation_date, @last_update_date, @name, @firehose_arn, @state, @output_format)
  end
end
