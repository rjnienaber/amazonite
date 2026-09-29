private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetClientVpnEndpointAuthorizationPolicyResult
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String | Nil

    # The authorization policy document, written in the Cedar policy language.
    property policy_document : String | Nil

    # A brief description of the authorization policy.
    property description : String | Nil

    # Specifies whether the authorization policy is evaluated in shadow mode. Possible values include:
    #
    # - `enabled` - The authorization policy is evaluated and the results are logged, but access is
    # not enforced.
    #
    # - `disabled` - The authorization policy is enforced.
    property shadow_mode : ClientVpnAuthorizationPolicyShadowMode | Nil

    # The current state of the authorization policy.
    property status : ClientVpnAuthorizationPolicyStatus | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @description : String | Nil = nil,
      @shadow_mode : ClientVpnAuthorizationPolicyShadowMode | Nil = nil,
      @status : ClientVpnAuthorizationPolicyStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @shadow_mode
        params << {"#{prefix}ShadowMode", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='policyDocument']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        shadow_mode: (n = node.xpath_node("*[local-name()='shadowMode']")) ? AEC::ClientVpnAuthorizationPolicyShadowMode.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ClientVpnAuthorizationPolicyStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @policy_document, @description, @shadow_mode, @status)
  end
end
