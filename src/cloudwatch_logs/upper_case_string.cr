private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @with_keys
        raise Core::ValidationError.new("withKeys must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("withKeys must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@with_keys)
  end
end
