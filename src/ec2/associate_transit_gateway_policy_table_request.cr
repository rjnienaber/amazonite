private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateTransitGatewayPolicyTableRequest
    # The ID of the transit gateway policy table to associate with the transit gateway attachment.
    property transit_gateway_policy_table_id : String

    # The ID of the transit gateway attachment to associate with the policy table.
    property transit_gateway_attachment_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_policy_table_id : String,
      @transit_gateway_attachment_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayPolicyTableId", @transit_gateway_policy_table_id}

      params << {"#{prefix}TransitGatewayAttachmentId", @transit_gateway_attachment_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_policy_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayPolicyTableId']")).not_nil!,
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_policy_table_id, @transit_gateway_attachment_id, @dry_run)
  end
end
