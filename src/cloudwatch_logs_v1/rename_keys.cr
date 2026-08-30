module Amazonite::CloudWatchLogsV1
  # Use this processor to rename keys in a log event.
  #
  # For more information about this processor including examples, see [
  # renameKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKeys)
  # in the *CloudWatch Logs User Guide*.
  class RenameKeys
    include JSON::Serializable

    # An array of `RenameKeyEntry` objects, where each object contains the information about a single
    # key to rename.
    @[JSON::Field(key: "entries")]
    property entries : Array(RenameKeyEntry) = [] of RenameKeyEntry

    def initialize(
      @entries : Array(RenameKeyEntry),
    )
    end

    def_equals_and_hash(@entries)
  end
end
