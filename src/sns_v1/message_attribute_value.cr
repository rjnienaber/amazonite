private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class MessageAttributeValue
    property data_type : String

    property string_value : String | Nil

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
