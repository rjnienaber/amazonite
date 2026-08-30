private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This object defines one value type that will be converted using the [
  # typeConverter](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-typeConverter)
  # processor.
  class TypeConverterEntry
    include JSON::Serializable

    # The key with the value that is to be converted to a different type.
    @[JSON::Field(key: "key")]
    property key : String

    # The type to convert the field value to. Valid values are `integer`, `double`, `string` and
    # `boolean`.
    @[JSON::Field(key: "type", converter: ACWL::Type)]
    property type : Type

    def initialize(
      @key : String,
      @type : Type,
    )
    end
  end
end
