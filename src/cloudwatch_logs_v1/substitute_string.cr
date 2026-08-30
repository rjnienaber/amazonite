module Amazonite::CloudWatchLogsV1
  # This processor matches a key’s value against a regular expression and replaces all matches with
  # a replacement string.
  #
  # For more information about this processor including examples, see [
  # substituteString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString)
  # in the *CloudWatch Logs User Guide*.
  class SubstituteString
    include JSON::Serializable

    # An array of objects, where each object contains the information about one key to match and
    # replace.
    @[JSON::Field(key: "entries")]
    property entries : Array(SubstituteStringEntry) = [] of SubstituteStringEntry

    def initialize(
      @entries : Array(SubstituteStringEntry),
    )
    end
  end
end
