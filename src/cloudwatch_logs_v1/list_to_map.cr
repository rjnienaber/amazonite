private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This processor takes a list of objects that contain key fields, and converts them into a map of
  # target keys.
  #
  # For more information about this processor including examples, see [
  # listToMap](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Processors.html#CloudWatch-Logs-Transformation-listToMap)
  # in the *CloudWatch Logs User Guide*.
  class ListToMap
    include JSON::Serializable

    # The key in the log event that has a list of objects that will be converted to a map.
    @[JSON::Field(key: "source")]
    property source : String

    # The key of the field to be extracted as keys in the generated map
    @[JSON::Field(key: "key")]
    property key : String

    # If this is specified, the values that you specify in this parameter will be extracted from the
    # `source` objects and put into the values of the generated map. Otherwise, original objects in
    # the source list will be put into the values of the generated map.
    @[JSON::Field(key: "valueKey")]
    property value_key : String | Nil

    # The key of the field that will hold the generated map
    @[JSON::Field(key: "target")]
    property target : String | Nil

    # A Boolean value to indicate whether the list will be flattened into single items. Specify `true`
    # to flatten the list. The default is `false`
    @[JSON::Field(key: "flatten")]
    property flatten : Bool | Nil

    # If you set `flatten` to `true`, use `flattenedElement` to specify which element, `first` or
    # `last`, to keep.
    #
    # You must specify this parameter if `flatten` is `true`
    @[JSON::Field(key: "flattenedElement", converter: ACWL::FlattenedElement)]
    property flattened_element : FlattenedElement | Nil

    def initialize(
      @source : String,
      @key : String,
      @value_key : String | Nil = nil,
      @target : String | Nil = nil,
      @flatten : Bool | Nil = nil,
      @flattened_element : FlattenedElement | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @source
        raise Core::ValidationError.new("source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("source length must be <= 128") if value.size > 128
      end

      if value = @key
        raise Core::ValidationError.new("key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("key length must be <= 128") if value.size > 128
      end

      if value = @value_key
        raise Core::ValidationError.new("valueKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("valueKey length must be <= 128") if value.size > 128
      end

      if value = @target
        raise Core::ValidationError.new("target length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("target length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@source, @key, @value_key, @target, @flatten, @flattened_element)
  end
end
