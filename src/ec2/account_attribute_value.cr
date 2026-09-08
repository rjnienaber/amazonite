private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a value of an account attribute.
  class AccountAttributeValue
    # The value of the attribute.
    property attribute_value : String | Nil

    def initialize(
      @attribute_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attribute_value
        params << {"#{prefix}AttributeValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute_value: Core::XMLValue.string(node.xpath_node("*[local-name()='attributeValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attribute_value)
  end
end
