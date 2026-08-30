private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This processor parses a specified field in the original log event into key-value pairs.
  #
  # For more information about this processor including examples, see [
  # parseKeyValue](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseKeyValue)
  # in the *CloudWatch Logs User Guide*.
  class ParseKeyValue
    include JSON::Serializable

    # Path to the field in the log event that will be parsed. Use dot notation to access child fields.
    # For example, `store.book`
    @[JSON::Field(key: "source")]
    property source : String | Nil

    # The destination field to put the extracted key-value pairs into
    @[JSON::Field(key: "destination")]
    property destination : String | Nil

    # The field delimiter string that is used between key-value pairs in the original log events. If
    # you omit this, the ampersand `&` character is used.
    @[JSON::Field(key: "fieldDelimiter")]
    property field_delimiter : String | Nil

    # The delimiter string to use between the key and value in each pair in the transformed log event.
    #
    # If you omit this, the equal `=` character is used.
    @[JSON::Field(key: "keyValueDelimiter")]
    property key_value_delimiter : String | Nil

    # If you want to add a prefix to all transformed keys, specify it here.
    @[JSON::Field(key: "keyPrefix")]
    property key_prefix : String | Nil

    # A value to insert into the value field in the result, when a key-value pair is not successfully
    # split.
    @[JSON::Field(key: "nonMatchValue")]
    property non_match_value : String | Nil

    # Specifies whether to overwrite the value if the destination key already exists. If you omit
    # this, the default is `false`.
    @[JSON::Field(key: "overwriteIfExists")]
    property overwrite_if_exists : Bool | Nil

    def initialize(
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @key_value_delimiter : String | Nil = nil,
      @key_prefix : String | Nil = nil,
      @non_match_value : String | Nil = nil,
      @overwrite_if_exists : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @source
        raise Core::ValidationError.new("source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("source length must be <= 128") if value.size > 128
      end

      if value = @destination
        raise Core::ValidationError.new("destination length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destination length must be <= 128") if value.size > 128
      end

      if value = @field_delimiter
        raise Core::ValidationError.new("fieldDelimiter length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("fieldDelimiter length must be <= 128") if value.size > 128
      end

      if value = @key_value_delimiter
        raise Core::ValidationError.new("keyValueDelimiter length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("keyValueDelimiter length must be <= 128") if value.size > 128
      end

      if value = @key_prefix
        raise Core::ValidationError.new("keyPrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("keyPrefix length must be <= 128") if value.size > 128
      end

      if value = @non_match_value
        raise Core::ValidationError.new("nonMatchValue length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("nonMatchValue length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@source, @destination, @field_delimiter, @key_value_delimiter, @key_prefix, @non_match_value, @overwrite_if_exists)
  end
end
