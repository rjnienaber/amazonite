private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # The user-specified message attribute value. For string data types, the value attribute has the
  # same restrictions on the content as the message body. For more information, see
  # [Publish](https://docs.aws.amazon.com/sns/latest/api/API_Publish.html).
  #
  # Name, type, and value must not be empty or null. In addition, the message body should not be
  # empty or null. All parts of the message attribute, including name, type, and value, are included
  # in the message size restriction, which is currently 256 KB (262,144 bytes). For more
  # information, see [Amazon SNS message
  # attributes](https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html) and [Publishing
  # to a mobile phone](https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html) in the
  # *Amazon SNS Developer Guide.*
  class MessageAttributeValue
    # Amazon SNS supports the following logical data types: String, String.Array, Number, and Binary.
    # For more information, see [Message Attribute Data
    # Types](https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes).
    property data_type : String

    # Strings are Unicode with UTF8 binary encoding. For a list of code values, see [ASCII Printable
    # Characters](https://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
    property string_value : String | Nil

    # Binary type attributes can store any binary data, for example, compressed data, encrypted data,
    # or images.
    property binary_value : Bytes | Nil

    def initialize(
      @data_type : String,
      @string_value : String | Nil = nil,
      @binary_value : Bytes | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DataType", @data_type}

      if value = @string_value
        params << {"#{prefix}StringValue", value}
      end

      if value = @binary_value
        params << {"#{prefix}BinaryValue", Core::QueryValue.bytes(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        data_type: Core::XMLValue.string(node.xpath_node("*[local-name()='DataType']")).not_nil!,
        string_value: Core::XMLValue.string(node.xpath_node("*[local-name()='StringValue']")),
        binary_value: Core::XMLValue.bytes(node.xpath_node("*[local-name()='BinaryValue']")),
      )
    end
  end
end
