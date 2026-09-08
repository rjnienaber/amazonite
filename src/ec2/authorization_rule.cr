private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an authorization rule.
  class AuthorizationRule
    # The ID of the Client VPN endpoint with which the authorization rule is associated.
    property client_vpn_endpoint_id : String | Nil

    # A brief description of the authorization rule.
    property description : String | Nil

    # The ID of the Active Directory group to which the authorization rule grants access.
    property group_id : String | Nil

    # Indicates whether the authorization rule grants access to all clients.
    property access_all : Bool | Nil

    # The IPv4 address range, in CIDR notation, of the network to which the authorization rule
    # applies.
    property destination_cidr : String | Nil

    # The current state of the authorization rule.
    property status : ClientVpnAuthorizationRuleStatus | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @description : String | Nil = nil,
      @group_id : String | Nil = nil,
      @access_all : Bool | Nil = nil,
      @destination_cidr : String | Nil = nil,
      @status : ClientVpnAuthorizationRuleStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @access_all
        params << {"#{prefix}AccessAll", Core::QueryValue.bool(value)}
      end

      if value = @destination_cidr
        params << {"#{prefix}DestinationCidr", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        access_all: Core::XMLValue.bool(node.xpath_node("*[local-name()='accessAll']")),
        destination_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidr']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnAuthorizationRuleStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @description, @group_id, @access_all, @destination_cidr, @status)
  end
end
