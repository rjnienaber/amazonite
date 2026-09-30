private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetAssociatedIpv6PoolCidrsResult
    # Information about the IPv6 CIDR block associations.
    property ipv_6_cidr_associations : Array(Ipv6CidrAssociation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @ipv_6_cidr_associations : Array(Ipv6CidrAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipv_6_cidr_associations || [] of Ipv6CidrAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6CidrAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_cidr_associations: node.xpath_nodes("*[local-name()='ipv6CidrAssociationSet']/*[local-name()='item']").map { |n| Ipv6CidrAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipv_6_cidr_associations, @next_token)
  end
end
