private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A CIDR provisioned to an IPAM pool.
  class IpamPoolCidr
    # The CIDR provisioned to the IPAM pool. A CIDR is a representation of an IP address and its
    # associated network mask (or netmask) and refers to a range of IP addresses. An IPv4 CIDR example
    # is `10.24.34.0/23`. An IPv6 CIDR example is `2001:DB8::/32`.
    property cidr : String | Nil

    # The state of the CIDR.
    property state : IpamPoolCidrState | Nil

    # Details related to why an IPAM pool CIDR failed to be provisioned.
    property failure_reason : IpamPoolCidrFailureReason | Nil

    # The IPAM pool CIDR ID.
    property ipam_pool_cidr_id : String | Nil

    # The netmask length of the CIDR you'd like to provision to a pool. Can be used for provisioning
    # Amazon-provided IPv6 CIDRs to top-level pools and for provisioning CIDRs to pools with source
    # pools. Cannot be used to provision BYOIP CIDRs to top-level pools. "NetmaskLength" or "Cidr" is
    # required.
    property netmask_length : Int32 | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @state : IpamPoolCidrState | Nil = nil,
      @failure_reason : IpamPoolCidrFailureReason | Nil = nil,
      @ipam_pool_cidr_id : String | Nil = nil,
      @netmask_length : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @failure_reason
        params.concat(value.to_query_params("#{prefix}FailureReason."))
      end

      if value = @ipam_pool_cidr_id
        params << {"#{prefix}IpamPoolCidrId", value}
      end

      if value = @netmask_length
        params << {"#{prefix}NetmaskLength", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamPoolCidrState.from_json_object_key?(n.content) : nil,
        failure_reason: node.xpath_node("*[local-name()='failureReason']").try { |n| IpamPoolCidrFailureReason.from_xml(n) },
        ipam_pool_cidr_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolCidrId']")),
        netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='netmaskLength']")),
      )
    end

    def validate! : Nil
      if value = @failure_reason
        value.validate!
      end
    end

    def_equals_and_hash(@cidr, @state, @failure_reason, @ipam_pool_cidr_id, @netmask_length)
  end
end
