private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecondarySubnetsResult
    # Information about the secondary subnets.
    property secondary_subnets : Array(SecondarySubnet) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @secondary_subnets : Array(SecondarySubnet) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@secondary_subnets || [] of SecondarySubnet).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondarySubnetSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_subnets: node.xpath_nodes("*[local-name()='secondarySubnetSet']/*[local-name()='item']").map { |n| SecondarySubnet.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @secondary_subnets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@secondary_subnets, @next_token)
  end
end
