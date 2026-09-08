private alias Core = Amazonite::Core

module Amazonite::EC2
  class ProvisionIpamPoolCidrResult
    # Information about the provisioned CIDR.
    property ipam_pool_cidr : IpamPoolCidr | Nil

    def initialize(
      @ipam_pool_cidr : IpamPoolCidr | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_pool_cidr
        params.concat(value.to_query_params("#{prefix}IpamPoolCidr."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_pool_cidr: node.xpath_node("*[local-name()='ipamPoolCidr']").try { |n| IpamPoolCidr.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_pool_cidr
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_pool_cidr)
  end
end
