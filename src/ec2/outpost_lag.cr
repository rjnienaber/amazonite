private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Outpost link aggregation group (LAG).
  class OutpostLag
    # The Amazon Resource Number (ARN) of the Outpost LAG.
    property outpost_arn : String | Nil

    # The ID of the Outpost LAG owner.
    property owner_id : String | Nil

    # The current state of the Outpost LAG.
    property state : String | Nil

    # The ID of the Outpost LAG.
    property outpost_lag_id : String | Nil

    # The IDs of the local gateway virtual interfaces associated with the Outpost LAG.
    property local_gateway_virtual_interface_ids : Array(String) | Nil

    # The service link virtual interface IDs associated with the Outpost LAG.
    property service_link_virtual_interface_ids : Array(String) | Nil

    # The tags associated with the Outpost LAG.
    property tags : Array(Tag) | Nil

    def initialize(
      @outpost_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @state : String | Nil = nil,
      @outpost_lag_id : String | Nil = nil,
      @local_gateway_virtual_interface_ids : Array(String) | Nil = nil,
      @service_link_virtual_interface_ids : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @outpost_lag_id
        params << {"#{prefix}OutpostLagId", value}
      end

      (@local_gateway_virtual_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LocalGatewayVirtualInterfaceIdSet.#{i}", item}
      end

      (@service_link_virtual_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceLinkVirtualInterfaceIdSet.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        outpost_lag_id: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostLagId']")),
        local_gateway_virtual_interface_ids: node.xpath_nodes("*[local-name()='localGatewayVirtualInterfaceIdSet']/*[local-name()='item']").map { |n| n.content },
        service_link_virtual_interface_ids: node.xpath_nodes("*[local-name()='serviceLinkVirtualInterfaceIdSet']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@outpost_arn, @owner_id, @state, @outpost_lag_id, @local_gateway_virtual_interface_ids, @service_link_virtual_interface_ids, @tags)
  end
end
