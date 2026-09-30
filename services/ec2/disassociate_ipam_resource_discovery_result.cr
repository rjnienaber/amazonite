private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateIpamResourceDiscoveryResult
    # A resource discovery association.
    property ipam_resource_discovery_association : IpamResourceDiscoveryAssociation | Nil

    def initialize(
      @ipam_resource_discovery_association : IpamResourceDiscoveryAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_resource_discovery_association
        params.concat(value.to_query_params("#{prefix}IpamResourceDiscoveryAssociation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_discovery_association: node.xpath_node("*[local-name()='ipamResourceDiscoveryAssociation']").try { |n| IpamResourceDiscoveryAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_resource_discovery_association
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_resource_discovery_association)
  end
end
