private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayAttachmentNatConfigurationResult
    # The ID of the transit gateway attachment.
    property transit_gateway_attachment_id : String | Nil

    # The state of NAT gateway support for the attachment.
    property nat_gateway_support : TransitGatewayAttachmentNatGatewaySupportState | Nil

    # Specifies whether the transit gateway installs routes for the NAT CIDRs in the route tables to
    # which the attachment propagates.
    property nat_system_route_support : TransitGatewayAttachmentNatSystemRouteSupportValue | Nil

    # The NAT gateway rules for the attachment.
    property nat_gateway_rules : Array(TransitGatewayNatRule) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @nat_gateway_support : TransitGatewayAttachmentNatGatewaySupportState | Nil = nil,
      @nat_system_route_support : TransitGatewayAttachmentNatSystemRouteSupportValue | Nil = nil,
      @nat_gateway_rules : Array(TransitGatewayNatRule) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @nat_gateway_support
        params << {"#{prefix}NatGatewaySupport", value.to_json_object_key}
      end

      if value = @nat_system_route_support
        params << {"#{prefix}NatSystemRouteSupport", value.to_json_object_key}
      end

      (@nat_gateway_rules || [] of TransitGatewayNatRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NatGatewayRuleSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        nat_gateway_support: (n = node.xpath_node("*[local-name()='natGatewaySupport']")) ? AEC::TransitGatewayAttachmentNatGatewaySupportState.from_json_object_key?(n.content) : nil,
        nat_system_route_support: (n = node.xpath_node("*[local-name()='natSystemRouteSupport']")) ? AEC::TransitGatewayAttachmentNatSystemRouteSupportValue.from_json_object_key?(n.content) : nil,
        nat_gateway_rules: node.xpath_nodes("*[local-name()='natGatewayRuleSet']/*[local-name()='item']").map { |n| TransitGatewayNatRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @nat_gateway_rules
        raise Core::ValidationError.new("NatGatewayRules must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("NatGatewayRules must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @nat_gateway_support, @nat_system_route_support, @nat_gateway_rules)
  end
end
