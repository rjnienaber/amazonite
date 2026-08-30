module Amazonite::CloudWatchLogsV1
  # This processor deletes entries from a log event. These entries are key-value pairs.
  #
  # For more information about this processor including examples, see [
  # deleteKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-deleteKeys)
  # in the *CloudWatch Logs User Guide*.
  class DeleteKeys
    include JSON::Serializable

    # The list of keys to delete.
    @[JSON::Field(key: "withKeys")]
    property with_keys : Array(String) = [] of String

    def initialize(
      @with_keys : Array(String),
    )
    end
  end
end
