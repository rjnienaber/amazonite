private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointConnectionsResult
    # Information about the VPC endpoint connections.
    property vpc_endpoint_connections : Array(VpcEndpointConnection) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @vpc_endpoint_connections : Array(VpcEndpointConnection) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpc_endpoint_connections || [] of VpcEndpointConnection).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcEndpointConnectionSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_endpoint_connections: node.xpath_nodes("*[local-name()='vpcEndpointConnectionSet']/*[local-name()='item']").map { |n| VpcEndpointConnection.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_endpoint_connections
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_endpoint_connections, @next_token)
  end
end
