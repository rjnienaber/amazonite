private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a value for a resource attribute that is a String.
  class AttributeValue
    # The attribute value. The value is case-sensitive.
    property value : String | Nil

    def initialize(
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
