private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamByoasnResult
    # ASN and BYOIP CIDR associations.
    property byoasns : Array(Byoasn) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @byoasns : Array(Byoasn) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@byoasns || [] of Byoasn).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ByoasnSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        byoasns: node.xpath_nodes("*[local-name()='byoasnSet']/*[local-name()='item']").map { |n| Byoasn.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @byoasns
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@byoasns, @next_token)
  end
end
