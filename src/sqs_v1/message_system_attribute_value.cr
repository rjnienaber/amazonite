private alias Core = Amazonite::Core

module Amazonite::SqsV1
  class MessageSystemAttributeValue
    include JSON::Serializable

    @[JSON::Field(key: "StringValue")]
    property string_value : String | Nil

    @[JSON::Field(key: "BinaryValue", converter: Core::Base64Converter)]
    property binary_value : Bytes | Nil

    @[JSON::Field(key: "StringListValues")]
    property string_list_values : Array(String) | Nil

    @[JSON::Field(key: "BinaryListValues", converter: Core::Base64ArrayConverter)]
    property binary_list_values : Array(Bytes) | Nil

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
  end
end
