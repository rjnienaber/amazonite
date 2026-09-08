private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the IPAMs.
    property ipams : Array(Ipam) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipams : Array(Ipam) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipams || [] of Ipam).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipams: node.xpath_nodes("*[local-name()='ipamSet']/*[local-name()='item']").map { |n| Ipam.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipams
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipams)
  end
end
