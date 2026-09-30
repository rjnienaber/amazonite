private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLocalGatewaysResult
    # Information about the local gateways.
    property local_gateways : Array(LocalGateway) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @local_gateways : Array(LocalGateway) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@local_gateways || [] of LocalGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LocalGatewaySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateways: node.xpath_nodes("*[local-name()='localGatewaySet']/*[local-name()='item']").map { |n| LocalGateway.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @local_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateways, @next_token)
  end
end
