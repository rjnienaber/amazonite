private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamResourceDiscoveryResult
    # The IPAM resource discovery.
    property ipam_resource_discovery : IpamResourceDiscovery | Nil

    def initialize(
      @ipam_resource_discovery : IpamResourceDiscovery | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_resource_discovery
        params.concat(value.to_query_params("#{prefix}IpamResourceDiscovery."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_discovery: node.xpath_node("*[local-name()='ipamResourceDiscovery']").try { |n| IpamResourceDiscovery.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_resource_discovery
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_resource_discovery)
  end
end
