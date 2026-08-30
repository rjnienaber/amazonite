module Amazonite::CloudWatchLogsV1
  # This processor moves a key from one field to another. The original key is deleted.
  #
  # For more information about this processor including examples, see [
  # moveKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKeys)
  # in the *CloudWatch Logs User Guide*.
  class MoveKeys
    include JSON::Serializable

    # An array of objects, where each object contains the information about one key to move.
    @[JSON::Field(key: "entries")]
    property entries : Array(MoveKeyEntry) = [] of MoveKeyEntry

    def initialize(
      @entries : Array(MoveKeyEntry),
    )
    end

    def_equals_and_hash(@entries)
  end
end
