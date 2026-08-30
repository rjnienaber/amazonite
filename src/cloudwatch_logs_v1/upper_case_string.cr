module Amazonite::CloudWatchLogsV1
  # This processor converts a string field to uppercase.
  #
  # For more information about this processor including examples, see [
  # upperCaseString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-upperCaseString)
  # in the *CloudWatch Logs User Guide*.
  class UpperCaseString
    include JSON::Serializable

    # The array of containing the keys of the field to convert to uppercase.
    @[JSON::Field(key: "withKeys")]
    property with_keys : Array(String) = [] of String

    def initialize(
      @with_keys : Array(String),
    )
    end
  end
end
