module Amazonite::CloudWatchLogsV1
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
  end
end
