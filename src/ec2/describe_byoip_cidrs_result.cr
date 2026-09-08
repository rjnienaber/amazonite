private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeByoipCidrsResult
    # Information about your address ranges.
    property byoip_cidrs : Array(ByoipCidr) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @byoip_cidrs : Array(ByoipCidr) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@byoip_cidrs || [] of ByoipCidr).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ByoipCidrSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        byoip_cidrs: node.xpath_nodes("*[local-name()='byoipCidrSet']/*[local-name()='item']").map { |n| ByoipCidr.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @byoip_cidrs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@byoip_cidrs, @next_token)
  end
end
