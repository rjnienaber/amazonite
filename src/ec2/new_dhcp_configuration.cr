private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a DHCP configuration option.
  class NewDhcpConfiguration
    # The name of a DHCP option.
    property key : String | Nil

    # The values for the DHCP option.
    property values : Array(String) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key
        params << {"#{prefix}Key", value}
      end

      (@values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Value.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='key']")),
        values: node.xpath_nodes("*[local-name()='Value']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key, @values)
  end
end
