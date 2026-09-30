private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeEgressOnlyInternetGatewaysResult
    # Information about the egress-only internet gateways.
    property egress_only_internet_gateways : Array(EgressOnlyInternetGateway) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @egress_only_internet_gateways : Array(EgressOnlyInternetGateway) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@egress_only_internet_gateways || [] of EgressOnlyInternetGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EgressOnlyInternetGatewaySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        egress_only_internet_gateways: node.xpath_nodes("*[local-name()='egressOnlyInternetGatewaySet']/*[local-name()='item']").map { |n| EgressOnlyInternetGateway.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @egress_only_internet_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@egress_only_internet_gateways, @next_token)
  end
end
