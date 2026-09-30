private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration of a subnet for a VPC endpoint.
  class SubnetConfiguration
    # The ID of the subnet.
    property subnet_id : String | Nil

    # The IPv4 address to assign to the endpoint network interface in the subnet. You must provide an
    # IPv4 address if the VPC endpoint supports IPv4.
    #
    # If you specify an IPv4 address when modifying a VPC endpoint, we replace the existing endpoint
    # network interface with a new endpoint network interface with this IP address. This process
    # temporarily disconnects the subnet and the VPC endpoint.
    property ipv_4 : String | Nil

    # The IPv6 address to assign to the endpoint network interface in the subnet. You must provide an
    # IPv6 address if the VPC endpoint supports IPv6.
    #
    # If you specify an IPv6 address when modifying a VPC endpoint, we replace the existing endpoint
    # network interface with a new endpoint network interface with this IP address. This process
    # temporarily disconnects the subnet and the VPC endpoint.
    property ipv_6 : String | Nil

    def initialize(
      @subnet_id : String | Nil = nil,
      @ipv_4 : String | Nil = nil,
      @ipv_6 : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @ipv_4
        params << {"#{prefix}Ipv4", value}
      end

      if value = @ipv_6
        params << {"#{prefix}Ipv6", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        ipv_4: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv4']")),
        ipv_6: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subnet_id, @ipv_4, @ipv_6)
  end
end
