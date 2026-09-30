private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @with_keys
        raise Core::ValidationError.new("withKeys must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("withKeys must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@with_keys)
  end
end
