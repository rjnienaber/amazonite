private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a DHCP configuration option.
  class DhcpConfiguration
    # The name of a DHCP option.
    property key : String | Nil

    # The values for the DHCP option.
    property values : Array(AttributeValue) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(AttributeValue) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key
        params << {"#{prefix}Key", value}
      end

      (@values || [] of AttributeValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ValueSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='key']")),
        values: node.xpath_nodes("*[local-name()='valueSet']/*[local-name()='item']").map { |n| AttributeValue.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @values
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
