private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("key length must be <= 128") if value.size > 128
      end

      if value = @value
        raise Core::ValidationError.new("value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("value length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@key, @value, @overwrite_if_exists)
  end
end
