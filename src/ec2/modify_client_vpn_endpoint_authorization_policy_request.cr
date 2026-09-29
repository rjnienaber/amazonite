private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyClientVpnEndpointAuthorizationPolicyRequest
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String

    # The authorization policy document, written in the Cedar policy language. This parameter is
    # required when you create the authorization policy for a Client VPN endpoint that does not
    # already have one.
    property policy_document : String | Nil

    # A brief description of the authorization policy.
    property description : String | Nil

    # Specifies whether the authorization policy is evaluated in shadow mode. Possible values include:
    #
    # - `enabled` - The authorization policy is evaluated and the results are logged, but access is
    # not enforced.
    #
    # - `disabled` - The authorization policy is enforced.
    #
    # The default value is `disabled`.
    property shadow_mode : ClientVpnAuthorizationPolicyShadowMode | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @policy_document : String | Nil = nil,
      @description : String | Nil = nil,
      @shadow_mode : ClientVpnAuthorizationPolicyShadowMode | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @shadow_mode
        params << {"#{prefix}ShadowMode", value.to_json_object_key}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        shadow_mode: (n = node.xpath_node("*[local-name()='ShadowMode']")) ? AEC::ClientVpnAuthorizationPolicyShadowMode.from_json_object_key?(n.content) : nil,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @policy_document, @description, @shadow_mode, @client_token, @dry_run)
  end
end
