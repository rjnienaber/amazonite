private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("entries must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("entries must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entries)
  end
end
