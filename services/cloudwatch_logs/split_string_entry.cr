private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # This object defines one log field that will be split with the [
  # splitString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString)
  # processor.
  class SplitStringEntry
    include JSON::Serializable

    # The key of the field to split.
    @[JSON::Field(key: "source")]
    property source : String

    # The separator characters to split the string entry on.
    @[JSON::Field(key: "delimiter")]
    property delimiter : String

    def initialize(
      @source : String,
      @delimiter : String,
    )
    end

    def validate! : Nil
      if value = @source
        raise Core::ValidationError.new("source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("source length must be <= 128") if value.size > 128
      end

      if value = @delimiter
        raise Core::ValidationError.new("delimiter length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("delimiter length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@source, @delimiter)
  end
end
