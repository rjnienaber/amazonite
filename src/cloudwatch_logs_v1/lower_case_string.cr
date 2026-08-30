module Amazonite::CloudWatchLogsV1
  # This processor converts a string to lowercase.
  #
  # For more information about this processor including examples, see [
  # lowerCaseString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-lowerCaseString)
  # in the *CloudWatch Logs User Guide*.
  class LowerCaseString
    include JSON::Serializable

    # The array caontaining the keys of the fields to convert to lowercase.
    @[JSON::Field(key: "withKeys")]
    property with_keys : Array(String) = [] of String

    def initialize(
      @with_keys : Array(String),
    )
    end

    def_equals_and_hash(@with_keys)
  end
end
