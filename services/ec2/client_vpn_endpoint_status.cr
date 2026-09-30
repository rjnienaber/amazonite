private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the state of a Client VPN endpoint.
  class ClientVpnEndpointStatus
    # The state of the Client VPN endpoint. Possible states include:
    #
    # - `pending-associate` - The Client VPN endpoint has been created but no target networks have
    # been associated. The Client VPN endpoint cannot accept connections.
    #
    # - `available` - The Client VPN endpoint has been created and a target network has been
    # associated. The Client VPN endpoint can accept connections.
    #
    # - `deleting` - The Client VPN endpoint is being deleted. The Client VPN endpoint cannot accept
    # connections.
    #
    # - `deleted` - The Client VPN endpoint has been deleted. The Client VPN endpoint cannot accept
    # connections.
    #
    # - `pending` - The Client VPN endpoint has been created with a Transit Gateway configuration and
    # is waiting for the Transit Gateway attachment to be accepted. The Client VPN endpoint cannot
    # accept connections.
    property code : ClientVpnEndpointStatusCode | Nil

    # A message about the status of the Client VPN endpoint.
    property message : String | Nil

    def initialize(
      @code : ClientVpnEndpointStatusCode | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_json_object_key}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: (n = node.xpath_node("*[local-name()='code']")) ? AEC::ClientVpnEndpointStatusCode.from_json_object_key?(n.content) : nil,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
