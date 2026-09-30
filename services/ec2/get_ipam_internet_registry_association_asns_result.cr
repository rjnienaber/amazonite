private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamInternetRegistryAssociationAsnsResult
    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The ASNs registered with the internet registry.
    property ipam_internet_registry_association_asns : Array(IpamInternetRegistryAssociationAsn) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_internet_registry_association_asns : Array(IpamInternetRegistryAssociationAsn) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_internet_registry_association_asns || [] of IpamInternetRegistryAssociationAsn).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamInternetRegistryAssociationAsnSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_internet_registry_association_asns: node.xpath_nodes("*[local-name()='ipamInternetRegistryAssociationAsnSet']/*[local-name()='item']").map { |n| IpamInternetRegistryAssociationAsn.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_internet_registry_association_asns
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_internet_registry_association_asns)
  end
end
