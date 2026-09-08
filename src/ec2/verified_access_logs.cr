private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the options for Verified Access logs.
  class VerifiedAccessLogs
    # Amazon S3 logging options.
    property s3 : VerifiedAccessLogS3Destination | Nil

    # CloudWatch Logs logging destination.
    property cloud_watch_logs : VerifiedAccessLogCloudWatchLogsDestination | Nil

    # Kinesis logging destination.
    property kinesis_data_firehose : VerifiedAccessLogKinesisDataFirehoseDestination | Nil

    # The log version.
    property log_version : String | Nil

    # Indicates whether trust data is included in the logs.
    property include_trust_context : Bool | Nil

    def initialize(
      @s3 : VerifiedAccessLogS3Destination | Nil = nil,
      @cloud_watch_logs : VerifiedAccessLogCloudWatchLogsDestination | Nil = nil,
      @kinesis_data_firehose : VerifiedAccessLogKinesisDataFirehoseDestination | Nil = nil,
      @log_version : String | Nil = nil,
      @include_trust_context : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @s3
        params.concat(value.to_query_params("#{prefix}S3."))
      end

      if value = @cloud_watch_logs
        params.concat(value.to_query_params("#{prefix}CloudWatchLogs."))
      end

      if value = @kinesis_data_firehose
        params.concat(value.to_query_params("#{prefix}KinesisDataFirehose."))
      end

      if value = @log_version
        params << {"#{prefix}LogVersion", value}
      end

      if value = @include_trust_context
        params << {"#{prefix}IncludeTrustContext", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3: node.xpath_node("*[local-name()='s3']").try { |n| VerifiedAccessLogS3Destination.from_xml(n) },
        cloud_watch_logs: node.xpath_node("*[local-name()='cloudWatchLogs']").try { |n| VerifiedAccessLogCloudWatchLogsDestination.from_xml(n) },
        kinesis_data_firehose: node.xpath_node("*[local-name()='kinesisDataFirehose']").try { |n| VerifiedAccessLogKinesisDataFirehoseDestination.from_xml(n) },
        log_version: Core::XMLValue.string(node.xpath_node("*[local-name()='logVersion']")),
        include_trust_context: Core::XMLValue.bool(node.xpath_node("*[local-name()='includeTrustContext']")),
      )
    end

    def validate! : Nil
      if value = @s3
        value.validate!
      end

      if value = @cloud_watch_logs
        value.validate!
      end

      if value = @kinesis_data_firehose
        value.validate!
      end
    end

    def_equals_and_hash(@s3, @cloud_watch_logs, @kinesis_data_firehose, @log_version, @include_trust_context)
  end
end
