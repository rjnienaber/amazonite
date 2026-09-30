private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between a subnet and an IPv6 CIDR block.
  class SubnetIpv6CidrBlockAssociation
    # The ID of the association.
    property association_id : String | Nil

    # The IPv6 CIDR block.
    property ipv_6_cidr_block : String | Nil

    # The state of the CIDR block.
    property ipv_6_cidr_block_state : SubnetCidrBlockState | Nil

    # Public IPv6 addresses are those advertised on the internet from Amazon Web Services. Private IP
    # addresses are not and cannot be advertised on the internet from Amazon Web Services.
    property ipv_6_address_attribute : Ipv6AddressAttribute | Nil

    # The source that allocated the IP address space. `byoip` or `amazon` indicates public IP address
    # space allocated by Amazon or space that you have allocated with Bring your own IP (BYOIP).
    # `none` indicates private space.
    property ip_source : IpSource | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
      @ipv_6_cidr_block_state : SubnetCidrBlockState | Nil = nil,
      @ipv_6_address_attribute : Ipv6AddressAttribute | Nil = nil,
      @ip_source : IpSource | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end

      if value = @ipv_6_cidr_block_state
        params.concat(value.to_query_params("#{prefix}Ipv6CidrBlockState."))
      end

      if value = @ipv_6_address_attribute
        params << {"#{prefix}Ipv6AddressAttribute", value.to_json_object_key}
      end

      if value = @ip_source
        params << {"#{prefix}IpSource", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6CidrBlock']")),
        ipv_6_cidr_block_state: node.xpath_node("*[local-name()='ipv6CidrBlockState']").try { |n| SubnetCidrBlockState.from_xml(n) },
        ipv_6_address_attribute: (n = node.xpath_node("*[local-name()='ipv6AddressAttribute']")) ? AEC::Ipv6AddressAttribute.from_json_object_key?(n.content) : nil,
        ip_source: (n = node.xpath_node("*[local-name()='ipSource']")) ? AEC::IpSource.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_block_state
        value.validate!
      end
    end

    def_equals_and_hash(@association_id, @ipv_6_cidr_block, @ipv_6_cidr_block_state, @ipv_6_address_attribute, @ip_source)
  end
end
