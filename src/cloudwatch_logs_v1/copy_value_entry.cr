module Amazonite::CloudWatchLogsV1
  # This object defines one value to be copied with the [
  # copyValue](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copoyValue)
  # processor.
  class CopyValueEntry
    include JSON::Serializable

    # The key to copy.
    @[JSON::Field(key: "source")]
    property source : String

    # The key of the field to copy the value to.
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
  end
end
