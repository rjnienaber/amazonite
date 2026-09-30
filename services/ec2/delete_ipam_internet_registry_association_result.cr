private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamInternetRegistryAssociationResult
    # Information about the deleted internet registry association.
    property ipam_internet_registry_association : IpamInternetRegistryAssociation | Nil

    def initialize(
      @ipam_internet_registry_association : IpamInternetRegistryAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_internet_registry_association
        params.concat(value.to_query_params("#{prefix}IpamInternetRegistryAssociation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_internet_registry_association: node.xpath_node("*[local-name()='ipamInternetRegistryAssociation']").try { |n| IpamInternetRegistryAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_internet_registry_association
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_internet_registry_association)
  end
end
