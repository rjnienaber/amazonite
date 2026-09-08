private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a value for a resource attribute that is a Boolean value.
  class AttributeBooleanValue
    # The attribute value. The valid values are `true` or `false`.
    property value : Bool | Nil

    def initialize(
      @value : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.bool(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
