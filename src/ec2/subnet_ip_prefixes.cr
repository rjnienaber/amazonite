private alias Core = Amazonite::Core

module Amazonite::EC2
  # Prefixes of the subnet IP.
  class SubnetIpPrefixes
    # ID of the subnet.
    property subnet_id : String | Nil

    # Array of SubnetIpPrefixes objects.
    property ip_prefixes : Array(String) | Nil

    def initialize(
      @subnet_id : String | Nil = nil,
      @ip_prefixes : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      (@ip_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}IpPrefixSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        ip_prefixes: node.xpath_nodes("*[local-name()='ipPrefixSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subnet_id, @ip_prefixes)
  end
end
