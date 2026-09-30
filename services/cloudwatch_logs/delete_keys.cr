private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @with_keys
        raise Core::ValidationError.new("withKeys must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("withKeys must have at most 5 item(s)") if value.size > 5
      end
    end

    def_equals_and_hash(@with_keys)
  end
end
