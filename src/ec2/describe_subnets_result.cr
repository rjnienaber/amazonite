private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSubnetsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the subnets.
    property subnets : Array(Subnet) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @subnets : Array(Subnet) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@subnets || [] of Subnet).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SubnetSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        subnets: node.xpath_nodes("*[local-name()='subnetSet']/*[local-name()='item']").map { |n| Subnet.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @subnets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @subnets)
  end
end
