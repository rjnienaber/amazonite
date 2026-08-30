module Amazonite::CloudWatchLogsV1
  # This object defines one key that will be moved with the [
  # moveKey](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKey)
  # processor.
  class MoveKeyEntry
    include JSON::Serializable

    # The key to move.
    @[JSON::Field(key: "source")]
    property source : String

    # The key to move to.
    @[JSON::Field(key: "target")]
    property target : String

    # Specifies whether to overwrite the value if the destination key already exists. If you omit
    # this, the default is `false`.
    @[JSON::Field(key: "overwriteIfExists")]
    property overwrite_if_exists : Bool | Nil

    def initialize(
      @source : String,
      @target : String,
      @overwrite_if_exists : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@source, @target, @overwrite_if_exists)
  end
end
