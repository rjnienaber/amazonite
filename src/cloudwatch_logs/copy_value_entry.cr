private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @source
        raise Core::ValidationError.new("source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("source length must be <= 128") if value.size > 128
      end

      if value = @target
        raise Core::ValidationError.new("target length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("target length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@source, @target, @overwrite_if_exists)
  end
end
