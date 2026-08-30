module Amazonite::CloudWatchLogsV1
  # This processor copies values within a log event. You can also use this processor to add metadata
  # to log events by copying the values of the following metadata keys into the log events:
  # `@logGroupName`, `@logGroupStream`, `@accountId`, `@regionName`.
  #
  # For more information about this processor including examples, see [
  # copyValue](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copyValue)
  # in the *CloudWatch Logs User Guide*.
  class CopyValue
    include JSON::Serializable

    # An array of `CopyValueEntry` objects, where each object contains the information about one field
    # value to copy.
    @[JSON::Field(key: "entries")]
    property entries : Array(CopyValueEntry) = [] of CopyValueEntry

    def initialize(
      @entries : Array(CopyValueEntry),
    )
    end
  end
end
