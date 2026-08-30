private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This processor adds new key-value pairs to the log event.
  #
  # For more information about this processor including examples, see [
  # addKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKeys)
  # in the *CloudWatch Logs User Guide*.
  class AddKeys
    include JSON::Serializable

    # An array of objects, where each object contains the information about one key to add to the log
    # event.
    @[JSON::Field(key: "entries")]
    property entries : Array(AddKeyEntry) = [] of AddKeyEntry

    def initialize(
      @entries : Array(AddKeyEntry),
    )
    end

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("entries must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("entries must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entries)
  end
end
