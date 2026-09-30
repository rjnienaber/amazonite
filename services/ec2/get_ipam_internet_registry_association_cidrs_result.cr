private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamInternetRegistryAssociationCidrsResult
    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The CIDRs registered with the internet registry.
    property ipam_internet_registry_association_cidrs : Array(IpamInternetRegistryAssociationCidr) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_internet_registry_association_cidrs : Array(IpamInternetRegistryAssociationCidr) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_internet_registry_association_cidrs || [] of IpamInternetRegistryAssociationCidr).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamInternetRegistryAssociationCidrSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_internet_registry_association_cidrs: node.xpath_nodes("*[local-name()='ipamInternetRegistryAssociationCidrSet']/*[local-name()='item']").map { |n| IpamInternetRegistryAssociationCidr.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_internet_registry_association_cidrs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_internet_registry_association_cidrs)
  end
end
