module Amazonite::CloudWatchLogsV1
  # Use this processor to split a field into an array of strings using a delimiting character.
  #
  # For more information about this processor including examples, see [
  # splitString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString)
  # in the *CloudWatch Logs User Guide*.
  class SplitString
    include JSON::Serializable

    # An array of `SplitStringEntry` objects, where each object contains the information about one
    # field to split.
    @[JSON::Field(key: "entries")]
    property entries : Array(SplitStringEntry) = [] of SplitStringEntry

    def initialize(
      @entries : Array(SplitStringEntry),
    )
    end

    def_equals_and_hash(@entries)
  end
end
