private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # The `CSV` processor parses comma-separated values (CSV) from the log events into columns.
  #
  # For more information about this processor including examples, see [
  # csv](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-csv)
  # in the *CloudWatch Logs User Guide*.
  class CSV
    include JSON::Serializable

    # The character used used as a text qualifier for a single column of data. If you omit this, the
    # double quotation mark `"` character is used.
    @[JSON::Field(key: "quoteCharacter")]
    property quote_character : String | Nil

    # The character used to separate each column in the original comma-separated value log event. If
    # you omit this, the processor looks for the comma `,` character as the delimiter.
    @[JSON::Field(key: "delimiter")]
    property delimiter : String | Nil

    # An array of names to use for the columns in the transformed log event.
    #
    # If you omit this, default column names (`[column_1, column_2 ...]`) are used.
    @[JSON::Field(key: "columns")]
    property columns : Array(String) | Nil

    # The path to the field in the log event that has the comma separated values to be parsed. If you
    # omit this value, the whole log message is processed.
    @[JSON::Field(key: "source")]
    property source : String | Nil

    # The path to the parent field to put transformed key value pairs under. If you omit this value,
    # the key value pairs will be placed under the root node.
    @[JSON::Field(key: "destination")]
    property destination : String | Nil

    def initialize(
      @quote_character : String | Nil = nil,
      @delimiter : String | Nil = nil,
      @columns : Array(String) | Nil = nil,
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @quote_character
        raise Core::ValidationError.new("quoteCharacter length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("quoteCharacter length must be <= 1") if value.size > 1
      end

      if value = @delimiter
        raise Core::ValidationError.new("delimiter length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("delimiter length must be <= 2") if value.size > 2
      end

      if value = @columns
        raise Core::ValidationError.new("columns must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("columns must have at most 100 item(s)") if value.size > 100
      end

      if value = @source
        raise Core::ValidationError.new("source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("source length must be <= 128") if value.size > 128
      end

      if value = @destination
        raise Core::ValidationError.new("destination length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destination length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@quote_character, @delimiter, @columns, @source, @destination)
  end
end
