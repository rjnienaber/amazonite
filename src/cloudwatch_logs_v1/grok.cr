module Amazonite::CloudWatchLogsV1
  # This processor uses pattern matching to parse and structure unstructured data. This processor
  # can also extract fields from log messages.
  #
  # For more information about this processor including examples, see
  # [grok](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Configurable.html#CloudWatch-Logs-Transformation-Grok)
  # in the *CloudWatch Logs User Guide*.
  class Grok
    include JSON::Serializable

    # The path to the field in the log event that you want to parse. If you omit this value, the whole
    # log message is parsed.
    @[JSON::Field(key: "source")]
    property source : String | Nil

    # The grok pattern to match against the log event. For a list of supported grok patterns, see
    # [Supported grok
    # patterns](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Configurable.html#CloudWatch-Logs-Transformation-Grok).
    @[JSON::Field(key: "match")]
    property match : String

    def initialize(
      @match : String,
      @source : String | Nil = nil,
    )
    end

    def_equals_and_hash(@source, @match)
  end
end
