module Amazonite::CloudWatchLogsV1
  # This object defines one key that will be added with the [
  # addKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKey)
  # processor.
  class AddKeyEntry
    include JSON::Serializable

    # The key of the new entry to be added to the log event
    @[JSON::Field(key: "key")]
    property key : String

    # The value of the new entry to be added to the log event
    @[JSON::Field(key: "value")]
    property value : String

    # Specifies whether to overwrite the value if the key already exists in the log event. If you omit
    # this, the default is `false`.
    @[JSON::Field(key: "overwriteIfExists")]
    property overwrite_if_exists : Bool | Nil

    def initialize(
      @key : String,
      @value : String,
      @overwrite_if_exists : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @value, @overwrite_if_exists)
  end
end
