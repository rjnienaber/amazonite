private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointsResult
    # Information about the VPC endpoints.
    property vpc_endpoints : Array(VpcEndpoint) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    property next_token : String | Nil

    def initialize(
      @vpc_endpoints : Array(VpcEndpoint) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpc_endpoints || [] of VpcEndpoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcEndpointSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_endpoints: node.xpath_nodes("*[local-name()='vpcEndpointSet']/*[local-name()='item']").map { |n| VpcEndpoint.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_endpoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_endpoints, @next_token)
  end
end
