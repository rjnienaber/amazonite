module Amazonite::SqsV1
  class MessageSystemAttributeValue
    property data_type : String
    property string_value : String | Nil
    property binary_value : String | Nil
    property string_list_values : Array(String) | Nil
    property binary_list_values : Array(String) | Nil

    def initialize(
      @data_type : String,
      @string_value : String | Nil = nil,
      @binary_value : String | Nil = nil,
      @string_list_values : Array(String) | Nil = nil,
      @binary_list_values : Array(String) | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      values = {} of Symbol => String
      string_list_values = [] of String
      binary_list_values = [] of String
      node.children.each do |n|
        case n.name
        when "DataType"    then values[:data_type] = n.children[0].to_s
        when "StringValue" then @string_value = n.children[0].to_s
        when "BinaryValue" then @binary_value = n.children[0].to_s
        when "String"      then string_list_values << n.children[0].to_s
        when "Binary"      then binary_list_values << n.children[0].to_s
        end
      end

      @data_type = values[:data_type]
      @string_list_values = string_list_values unless string_list_values.size.zero?
      @binary_list_values = binary_list_values unless binary_list_values.size.zero?
    end
  end
end
