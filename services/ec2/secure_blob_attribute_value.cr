private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a value for a resource attribute that is a Base64-encoded binary data object.
  class SecureBlobAttributeValue
    # The attribute value.
    property value : Bytes | Nil

    def initialize(
      @value : Bytes | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", Core::QueryValue.bytes(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.bytes(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
