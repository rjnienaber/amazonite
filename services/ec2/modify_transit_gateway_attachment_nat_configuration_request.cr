private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayAttachmentNatConfigurationRequest
    # The ID of the transit gateway attachment.
    property transit_gateway_attachment_id : String

    # Specifies whether to enable or disable NAT gateway support for the attachment. To enable NAT
    # gateway support, the attachment must have at least one NAT gateway rule. You can't modify the
    # NAT configuration while NAT gateway support is `enabling` or `disabling`. If you omit this
    # parameter, the current value doesn't change.
    property nat_gateway_support : TransitGatewayAttachmentNatGatewaySupportValue | Nil

    # Specifies whether the transit gateway installs routes for the NAT CIDRs in the route tables to
    # which the attachment propagates. For VPC attachments, the transit gateway always installs these
    # routes. You can enable or disable this option only for Amazon Web Services Direct Connect
    # gateway attachments and Site-to-Site VPN attachments that use dynamic routing. For these
    # attachments, the default is `enable`. If you omit this parameter, the current value doesn't
    # change.
    property nat_system_route_support : TransitGatewayAttachmentNatSystemRouteSupportValue | Nil

    # The NAT gateway rules for the attachment. The rules that you specify replace all existing NAT
    # gateway rules for the attachment. You can specify up to 50 rules for an attachment. If you omit
    # this parameter, the existing rules don't change. To remove all rules, use
    # `ResetNatGatewayRules`.
    property nat_gateway_rules : Array(TransitGatewayNatRuleRequest) | Nil

    # Specifies whether to remove all NAT gateway rules from the attachment. If you omit this
    # parameter, the transit gateway doesn't remove any rules. You can't specify this parameter
    # together with `NatGatewayRules`. Because you can't enable NAT gateway support without rules,
    # also set `NatGatewaySupport` to `disable` in the same request if NAT gateway support is
    # currently enabled.
    property reset_nat_gateway_rules : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_attachment_id : String,
      @nat_gateway_support : TransitGatewayAttachmentNatGatewaySupportValue | Nil = nil,
      @nat_system_route_support : TransitGatewayAttachmentNatSystemRouteSupportValue | Nil = nil,
      @nat_gateway_rules : Array(TransitGatewayNatRuleRequest) | Nil = nil,
      @reset_nat_gateway_rules : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayAttachmentId", @transit_gateway_attachment_id}

      if value = @nat_gateway_support
        params << {"#{prefix}NatGatewaySupport", value.to_json_object_key}
      end

      if value = @nat_system_route_support
        params << {"#{prefix}NatSystemRouteSupport", value.to_json_object_key}
      end

      (@nat_gateway_rules || [] of TransitGatewayNatRuleRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NatGatewayRule.#{i}."))
      end

      if value = @reset_nat_gateway_rules
        params << {"#{prefix}ResetNatGatewayRules", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")).not_nil!,
        nat_gateway_support: (n = node.xpath_node("*[local-name()='NatGatewaySupport']")) ? AEC::TransitGatewayAttachmentNatGatewaySupportValue.from_json_object_key?(n.content) : nil,
        nat_system_route_support: (n = node.xpath_node("*[local-name()='NatSystemRouteSupport']")) ? AEC::TransitGatewayAttachmentNatSystemRouteSupportValue.from_json_object_key?(n.content) : nil,
        nat_gateway_rules: node.xpath_nodes("*[local-name()='NatGatewayRule']/*[local-name()='item']").map { |n| TransitGatewayNatRuleRequest.from_xml(n) },
        reset_nat_gateway_rules: Core::XMLValue.bool(node.xpath_node("*[local-name()='ResetNatGatewayRules']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @nat_gateway_rules
        raise Core::ValidationError.new("NatGatewayRules must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("NatGatewayRules must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @nat_gateway_support, @nat_system_route_support, @nat_gateway_rules, @reset_nat_gateway_rules, @dry_run)
  end
end
