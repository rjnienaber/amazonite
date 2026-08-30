module Amazonite::CloudWatchLogsV1
  # Use this processor to remove leading and trailing whitespace.
  #
  # For more information about this processor including examples, see [
  # trimString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString)
  # in the *CloudWatch Logs User Guide*.
  class TrimString
    include JSON::Serializable

    # The array containing the keys of the fields to trim.
    @[JSON::Field(key: "withKeys")]
    property with_keys : Array(String) = [] of String

    def initialize(
      @with_keys : Array(String),
    )
    end
  end
end
