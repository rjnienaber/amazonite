private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeClientVpnTargetNetworksResult
    # Information about the associated target networks.
    property client_vpn_target_networks : Array(TargetNetwork) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @client_vpn_target_networks : Array(TargetNetwork) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@client_vpn_target_networks || [] of TargetNetwork).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ClientVpnTargetNetworks.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_target_networks: node.xpath_nodes("*[local-name()='clientVpnTargetNetworks']/*[local-name()='item']").map { |n| TargetNetwork.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @client_vpn_target_networks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_vpn_target_networks, @next_token)
  end
end
