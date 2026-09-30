private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamResourceCidrResult
    # The CIDR of the resource.
    property ipam_resource_cidr : IpamResourceCidr | Nil

    def initialize(
      @ipam_resource_cidr : IpamResourceCidr | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_resource_cidr
        params.concat(value.to_query_params("#{prefix}IpamResourceCidr."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_cidr: node.xpath_node("*[local-name()='ipamResourceCidr']").try { |n| IpamResourceCidr.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_resource_cidr
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_resource_cidr)
  end
end
