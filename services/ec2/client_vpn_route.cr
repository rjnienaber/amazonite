private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a Client VPN endpoint route.
  class ClientVpnRoute
    # The ID of the Client VPN endpoint with which the route is associated.
    property client_vpn_endpoint_id : String | Nil

    # The IPv4 address range, in CIDR notation, of the route destination.
    property destination_cidr : String | Nil

    # The ID of the subnet through which traffic is routed.
    property target_subnet : String | Nil

    # The route type.
    property type : String | Nil

    # Indicates how the route was associated with the Client VPN endpoint. `associate` indicates that
    # the route was automatically added when the target network was associated with the Client VPN
    # endpoint. `add-route` indicates that the route was manually added using the
    # **CreateClientVpnRoute** action.
    property origin : String | Nil

    # The current state of the route.
    property status : ClientVpnRouteStatus | Nil

    # A brief description of the route.
    property description : String | Nil

    # The ID of the Transit Gateway attachment, if the route targets a Transit Gateway.
    property transit_gateway_attachment_id : String | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @destination_cidr : String | Nil = nil,
      @target_subnet : String | Nil = nil,
      @type : String | Nil = nil,
      @origin : String | Nil = nil,
      @status : ClientVpnRouteStatus | Nil = nil,
      @description : String | Nil = nil,
      @transit_gateway_attachment_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @destination_cidr
        params << {"#{prefix}DestinationCidr", value}
      end

      if value = @target_subnet
        params << {"#{prefix}TargetSubnet", value}
      end

      if value = @type
        params << {"#{prefix}Type", value}
      end

      if value = @origin
        params << {"#{prefix}Origin", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        destination_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidr']")),
        target_subnet: Core::XMLValue.string(node.xpath_node("*[local-name()='targetSubnet']")),
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        origin: Core::XMLValue.string(node.xpath_node("*[local-name()='origin']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnRouteStatus.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @destination_cidr, @target_subnet, @type, @origin, @status, @description, @transit_gateway_attachment_id)
  end
end
