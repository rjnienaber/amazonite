private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpnConcentratorsResult
    # Information about the VPN concentrators.
    property vpn_concentrators : Array(VpnConcentrator) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @vpn_concentrators : Array(VpnConcentrator) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpn_concentrators || [] of VpnConcentrator).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpnConcentratorSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_concentrators: node.xpath_nodes("*[local-name()='vpnConcentratorSet']/*[local-name()='item']").map { |n| VpnConcentrator.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpn_concentrators
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpn_concentrators, @next_token)
  end
end
