private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcPeeringConnectionsResult
    # Information about the VPC peering connections.
    property vpc_peering_connections : Array(VpcPeeringConnection) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @vpc_peering_connections : Array(VpcPeeringConnection) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpc_peering_connections || [] of VpcPeeringConnection).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcPeeringConnectionSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_peering_connections: node.xpath_nodes("*[local-name()='vpcPeeringConnectionSet']/*[local-name()='item']").map { |n| VpcPeeringConnection.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_peering_connections
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_peering_connections, @next_token)
  end
end
