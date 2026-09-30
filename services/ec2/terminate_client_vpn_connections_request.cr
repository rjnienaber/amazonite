private alias Core = Amazonite::Core

module Amazonite::EC2
  class TerminateClientVpnConnectionsRequest
    # The ID of the Client VPN endpoint to which the client is connected.
    property client_vpn_endpoint_id : String

    # The ID of the client connection to be terminated.
    property connection_id : String | Nil

    # The name of the user who initiated the connection. Use this option to terminate all active
    # connections for the specified user. This option can only be used if the user has established up
    # to five connections.
    property username : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @connection_id : String | Nil = nil,
      @username : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      if value = @connection_id
        params << {"#{prefix}ConnectionId", value}
      end

      if value = @username
        params << {"#{prefix}Username", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionId']")),
        username: Core::XMLValue.string(node.xpath_node("*[local-name()='Username']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @connection_id, @username, @dry_run)
  end
end
