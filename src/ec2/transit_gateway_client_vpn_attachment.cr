private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Transit Gateway attachment for a Client VPN endpoint.
  class TransitGatewayClientVpnAttachment
    # The ID of the Transit Gateway attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the Transit Gateway.
    property transit_gateway_id : String | Nil

    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String | Nil

    # The ID of the Amazon Web Services account that owns the Client VPN endpoint.
    property client_vpn_owner_id : String | Nil

    # The state of the Transit Gateway attachment.
    property state : TransitGatewayAttachmentStatusType | Nil

    # The date and time the Transit Gateway attachment was created.
    property creation_time : String | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @client_vpn_endpoint_id : String | Nil = nil,
      @client_vpn_owner_id : String | Nil = nil,
      @state : TransitGatewayAttachmentStatusType | Nil = nil,
      @creation_time : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @client_vpn_owner_id
        params << {"#{prefix}ClientVpnOwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        client_vpn_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnOwnerId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAttachmentStatusType.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='creationTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @transit_gateway_id, @client_vpn_endpoint_id, @client_vpn_owner_id, @state, @creation_time)
  end
end
