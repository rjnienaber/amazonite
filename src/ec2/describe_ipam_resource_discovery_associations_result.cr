private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamResourceDiscoveryAssociationsResult
    # The resource discovery associations.
    property ipam_resource_discovery_associations : Array(IpamResourceDiscoveryAssociation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @ipam_resource_discovery_associations : Array(IpamResourceDiscoveryAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_resource_discovery_associations || [] of IpamResourceDiscoveryAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamResourceDiscoveryAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_discovery_associations: node.xpath_nodes("*[local-name()='ipamResourceDiscoveryAssociationSet']/*[local-name()='item']").map { |n| IpamResourceDiscoveryAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_resource_discovery_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_resource_discovery_associations, @next_token)
  end
end
