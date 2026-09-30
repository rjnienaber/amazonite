private alias Core = Amazonite::Core

module Amazonite::EC2
  class TerminateClientVpnConnectionsResult
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String | Nil

    # The user who established the terminated client connections.
    property username : String | Nil

    # The current state of the client connections.
    property connection_statuses : Array(TerminateConnectionStatus) | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @username : String | Nil = nil,
      @connection_statuses : Array(TerminateConnectionStatus) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @username
        params << {"#{prefix}Username", value}
      end

      (@connection_statuses || [] of TerminateConnectionStatus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ConnectionStatuses.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        username: Core::XMLValue.string(node.xpath_node("*[local-name()='username']")),
        connection_statuses: node.xpath_nodes("*[local-name()='connectionStatuses']/*[local-name()='item']").map { |n| TerminateConnectionStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @connection_statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @username, @connection_statuses)
  end
end
