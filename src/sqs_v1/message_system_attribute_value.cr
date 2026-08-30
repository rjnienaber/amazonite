private alias Core = Amazonite::Core

module Amazonite::SqsV1
  # The user-specified message system attribute value. For string data types, the `Value` attribute
  # has the same restrictions on the content as the message body. For more information, see `
  # SendMessage.`
  #
  # `Name`, `type`, `value` and the message body must not be empty or null.
  class MessageSystemAttributeValue
    include JSON::Serializable

    # Strings are Unicode with UTF-8 binary encoding. For a list of code values, see [ASCII Printable
    # Characters](http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
    @[JSON::Field(key: "StringValue")]
    property string_value : String | Nil

    # Binary type attributes can store any binary data, such as compressed data, encrypted data, or
    # images.
    @[JSON::Field(key: "BinaryValue", converter: Core::Base64Converter)]
    property binary_value : Bytes | Nil

    # Not implemented. Reserved for future use.
    @[JSON::Field(key: "StringListValues")]
    property string_list_values : Array(String) | Nil

    # Not implemented. Reserved for future use.
    @[JSON::Field(key: "BinaryListValues", converter: Core::Base64ArrayConverter)]
    property binary_list_values : Array(Bytes) | Nil

    # Amazon SQS supports the following logical data types: `String`, `Number`, and `Binary`. For the
    # `Number` data type, you must use `StringValue`.
    #
    # You can also append custom labels. For more information, see [Amazon SQS Message
    # Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes)
    # in the *Amazon SQS Developer Guide*.
    @[JSON::Field(key: "DataType")]
    property data_type : String

    def initialize(
      @data_type : String,
      @string_value : String | Nil = nil,
      @binary_value : Bytes | Nil = nil,
      @string_list_values : Array(String) | Nil = nil,
      @binary_list_values : Array(Bytes) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@string_value, @binary_value, @string_list_values, @binary_list_values, @data_type)
  end
end
