private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway metering policy.
  class TransitGatewayMeteringPolicy
    # The ID of the transit gateway metering policy.
    property transit_gateway_metering_policy_id : String | Nil

    # The ID of the transit gateway associated with the metering policy.
    property transit_gateway_id : String | Nil

    # The IDs of the middlebox attachments associated with the metering policy.
    property middlebox_attachment_ids : Array(String) | Nil

    # The state of the transit gateway metering policy.
    property state : TransitGatewayMeteringPolicyState | Nil

    # The date and time when the metering policy update becomes effective.
    property update_effective_at : Time | Nil

    # The tags assigned to the transit gateway metering policy.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_metering_policy_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @middlebox_attachment_ids : Array(String) | Nil = nil,
      @state : TransitGatewayMeteringPolicyState | Nil = nil,
      @update_effective_at : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_metering_policy_id
        params << {"#{prefix}TransitGatewayMeteringPolicyId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      (@middlebox_attachment_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MiddleboxAttachmentIdSet.#{i}", item}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @update_effective_at
        params << {"#{prefix}UpdateEffectiveAt", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayMeteringPolicyId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        middlebox_attachment_ids: node.xpath_nodes("*[local-name()='middleboxAttachmentIdSet']/*[local-name()='item']").map { |n| n.content },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayMeteringPolicyState.from_json_object_key?(n.content) : nil,
        update_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='updateEffectiveAt']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_metering_policy_id, @transit_gateway_id, @middlebox_attachment_ids, @state, @update_effective_at, @tags)
  end
end
