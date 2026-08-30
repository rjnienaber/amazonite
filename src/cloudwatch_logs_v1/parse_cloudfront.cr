module Amazonite::CloudWatchLogsV1
  # This processor parses CloudFront vended logs, extract fields, and convert them into JSON format.
  # Encoded field values are decoded. Values that are integers and doubles are treated as such. For
  # more information about this processor including examples, see [
  # parseCloudfront](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseCloudfront)
  #
  # For more information about CloudFront log format, see [ Configure and use standard logs (access
  # logs)](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html).
  #
  # If you use this processor, it must be the first processor in your transformer.
  class ParseCloudfront
    include JSON::Serializable

    # Omit this parameter and the whole log message will be processed by this processor. No other
    # value than `@message` is allowed for `source`.
    @[JSON::Field(key: "source")]
    property source : String | Nil

    def initialize(
      @source : String | Nil = nil,
    )
    end

    def_equals_and_hash(@source)
  end
end
