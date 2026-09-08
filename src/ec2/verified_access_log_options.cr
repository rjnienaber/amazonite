private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for Verified Access logs.
  class VerifiedAccessLogOptions
    # Sends Verified Access logs to Amazon S3.
    property s3 : VerifiedAccessLogS3DestinationOptions | Nil

    # Sends Verified Access logs to CloudWatch Logs.
    property cloud_watch_logs : VerifiedAccessLogCloudWatchLogsDestinationOptions | Nil

    # Sends Verified Access logs to Kinesis.
    property kinesis_data_firehose : VerifiedAccessLogKinesisDataFirehoseDestinationOptions | Nil

    # The logging version.
    #
    # Valid values: `ocsf-0.1` | `ocsf-1.0.0-rc.2`
    property log_version : String | Nil

    # Indicates whether to include trust data sent by trust providers in the logs.
    property include_trust_context : Bool | Nil

    def initialize(
      @s3 : VerifiedAccessLogS3DestinationOptions | Nil = nil,
      @cloud_watch_logs : VerifiedAccessLogCloudWatchLogsDestinationOptions | Nil = nil,
      @kinesis_data_firehose : VerifiedAccessLogKinesisDataFirehoseDestinationOptions | Nil = nil,
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
        s3: node.xpath_node("*[local-name()='S3']").try { |n| VerifiedAccessLogS3DestinationOptions.from_xml(n) },
        cloud_watch_logs: node.xpath_node("*[local-name()='CloudWatchLogs']").try { |n| VerifiedAccessLogCloudWatchLogsDestinationOptions.from_xml(n) },
        kinesis_data_firehose: node.xpath_node("*[local-name()='KinesisDataFirehose']").try { |n| VerifiedAccessLogKinesisDataFirehoseDestinationOptions.from_xml(n) },
        log_version: Core::XMLValue.string(node.xpath_node("*[local-name()='LogVersion']")),
        include_trust_context: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeTrustContext']")),
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
