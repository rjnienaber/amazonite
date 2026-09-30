private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPN concentrator.
  class VpnConcentrator
    # The ID of the VPN concentrator.
    property vpn_concentrator_id : String | Nil

    # The current state of the VPN concentrator.
    property state : String | Nil

    # The ID of the transit gateway associated with the VPN concentrator.
    property transit_gateway_id : String | Nil

    # The ID of the transit gateway attachment for the VPN concentrator.
    property transit_gateway_attachment_id : String | Nil

    # The type of VPN concentrator.
    property type : String | Nil

    # Any tags assigned to the VPN concentrator.
    property tags : Array(Tag) | Nil

    def initialize(
      @vpn_concentrator_id : String | Nil = nil,
      @state : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @transit_gateway_attachment_id : String | Nil = nil,
      @type : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_concentrator_id
        params << {"#{prefix}VpnConcentratorId", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @type
        params << {"#{prefix}Type", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_concentrator_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnConcentratorId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpn_concentrator_id, @state, @transit_gateway_id, @transit_gateway_attachment_id, @type, @tags)
  end
end
