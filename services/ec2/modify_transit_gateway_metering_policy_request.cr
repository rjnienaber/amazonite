private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayMeteringPolicyRequest
    # The ID of the transit gateway metering policy to modify.
    property transit_gateway_metering_policy_id : String

    # The IDs of middlebox attachments to add to the metering policy.
    property add_middlebox_attachment_ids : Array(String) | Nil

    # The IDs of middlebox attachments to remove from the metering policy.
    property remove_middlebox_attachment_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_metering_policy_id : String,
      @add_middlebox_attachment_ids : Array(String) | Nil = nil,
      @remove_middlebox_attachment_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayMeteringPolicyId", @transit_gateway_metering_policy_id}

      (@add_middlebox_attachment_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddMiddleboxAttachmentId.#{i}", item}
      end

      (@remove_middlebox_attachment_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveMiddleboxAttachmentId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayMeteringPolicyId']")).not_nil!,
        add_middlebox_attachment_ids: node.xpath_nodes("*[local-name()='AddMiddleboxAttachmentId']/*[local-name()='item']").map { |n| n.content },
        remove_middlebox_attachment_ids: node.xpath_nodes("*[local-name()='RemoveMiddleboxAttachmentId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_metering_policy_id, @add_middlebox_attachment_ids, @remove_middlebox_attachment_ids, @dry_run)
  end
end
