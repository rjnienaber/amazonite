private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an account attribute.
  class AccountAttribute
    # The name of the account attribute.
    property attribute_name : String | Nil

    # The values for the account attribute.
    property attribute_values : Array(AccountAttributeValue) | Nil

    def initialize(
      @attribute_name : String | Nil = nil,
      @attribute_values : Array(AccountAttributeValue) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attribute_name
        params << {"#{prefix}AttributeName", value}
      end

      (@attribute_values || [] of AccountAttributeValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttributeValueSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute_name: Core::XMLValue.string(node.xpath_node("*[local-name()='attributeName']")),
        attribute_values: node.xpath_nodes("*[local-name()='attributeValueSet']/*[local-name()='item']").map { |n| AccountAttributeValue.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @attribute_values
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@attribute_name, @attribute_values)
  end
end
