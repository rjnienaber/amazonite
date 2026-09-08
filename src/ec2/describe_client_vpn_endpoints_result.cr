private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeClientVpnEndpointsResult
    # Information about the Client VPN endpoints.
    property client_vpn_endpoints : Array(ClientVpnEndpoint) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @client_vpn_endpoints : Array(ClientVpnEndpoint) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@client_vpn_endpoints || [] of ClientVpnEndpoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ClientVpnEndpoint.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoints: node.xpath_nodes("*[local-name()='clientVpnEndpoint']/*[local-name()='item']").map { |n| ClientVpnEndpoint.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @client_vpn_endpoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_vpn_endpoints, @next_token)
  end
end
