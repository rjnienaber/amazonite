private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the VPCs.
    property vpcs : Array(Vpc) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @vpcs : Array(Vpc) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@vpcs || [] of Vpc).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        vpcs: node.xpath_nodes("*[local-name()='vpcSet']/*[local-name()='item']").map { |n| Vpc.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpcs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @vpcs)
  end
end
