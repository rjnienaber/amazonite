private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Use this processor to convert a value type associated with the specified key to the specified
  # type. It's a casting processor that changes the types of the specified fields. Values can be
  # converted into one of the following datatypes: `integer`, `double`, `string` and `boolean`.
  #
  # For more information about this processor including examples, see [
  # trimString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString)
  # in the *CloudWatch Logs User Guide*.
  class TypeConverter
    include JSON::Serializable

    # An array of `TypeConverterEntry` objects, where each object contains the information about one
    # field to change the type of.
    @[JSON::Field(key: "entries")]
    property entries : Array(TypeConverterEntry) = [] of TypeConverterEntry

    def initialize(
      @entries : Array(TypeConverterEntry),
    )
    end

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("entries must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("entries must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entries)
  end
end
