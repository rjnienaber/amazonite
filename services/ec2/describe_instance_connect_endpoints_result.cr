private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceConnectEndpointsResult
    # Information about the EC2 Instance Connect Endpoints.
    property instance_connect_endpoints : Array(Ec2InstanceConnectEndpoint) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @instance_connect_endpoints : Array(Ec2InstanceConnectEndpoint) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_connect_endpoints || [] of Ec2InstanceConnectEndpoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceConnectEndpointSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_connect_endpoints: node.xpath_nodes("*[local-name()='instanceConnectEndpointSet']/*[local-name()='item']").map { |n| Ec2InstanceConnectEndpoint.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @instance_connect_endpoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_connect_endpoints, @next_token)
  end
end
