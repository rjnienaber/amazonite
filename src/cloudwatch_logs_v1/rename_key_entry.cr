module Amazonite::CloudWatchLogsV1
  # This object defines one key that will be renamed with the [
  # renameKey](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKey)
  # processor.
  class RenameKeyEntry
    include JSON::Serializable

    # The key to rename
    @[JSON::Field(key: "key")]
    property key : String

    # The string to use for the new key name
    @[JSON::Field(key: "renameTo")]
    property rename_to : String

    # Specifies whether to overwrite the existing value if the destination key already exists. The
    # default is `false`
    @[JSON::Field(key: "overwriteIfExists")]
    property overwrite_if_exists : Bool | Nil

    def initialize(
      @key : String,
      @rename_to : String,
      @overwrite_if_exists : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @rename_to, @overwrite_if_exists)
  end
end
