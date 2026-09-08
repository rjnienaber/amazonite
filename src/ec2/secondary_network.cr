private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a secondary network.
  class SecondaryNetwork
    # The ID of the secondary network.
    property secondary_network_id : String | Nil

    # The Amazon Resource Name (ARN) of the secondary network.
    property secondary_network_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the secondary network.
    property owner_id : String | Nil

    # The type of the secondary network.
    property type : SecondaryNetworkType | Nil

    # The state of the secondary network.
    property state : SecondaryNetworkState | Nil

    # The reason for the current state of the secondary network.
    property state_reason : String | Nil

    # Information about the IPv4 CIDR blocks associated with the secondary network.
    property ipv_4_cidr_block_associations : Array(SecondaryNetworkIpv4CidrBlockAssociation) | Nil

    # The tags assigned to the secondary network.
    property tags : Array(Tag) | Nil

    def initialize(
      @secondary_network_id : String | Nil = nil,
      @secondary_network_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @type : SecondaryNetworkType | Nil = nil,
      @state : SecondaryNetworkState | Nil = nil,
      @state_reason : String | Nil = nil,
      @ipv_4_cidr_block_associations : Array(SecondaryNetworkIpv4CidrBlockAssociation) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @secondary_network_id
        params << {"#{prefix}SecondaryNetworkId", value}
      end

      if value = @secondary_network_arn
        params << {"#{prefix}SecondaryNetworkArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_reason
        params << {"#{prefix}StateReason", value}
      end

      (@ipv_4_cidr_block_associations || [] of SecondaryNetworkIpv4CidrBlockAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4CidrBlockAssociationSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryNetworkId']")),
        secondary_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryNetworkArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::SecondaryNetworkType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SecondaryNetworkState.from_json_object_key?(n.content) : nil,
        state_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateReason']")),
        ipv_4_cidr_block_associations: node.xpath_nodes("*[local-name()='ipv4CidrBlockAssociationSet']/*[local-name()='item']").map { |n| SecondaryNetworkIpv4CidrBlockAssociation.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipv_4_cidr_block_associations
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@secondary_network_id, @secondary_network_arn, @owner_id, @type, @state, @state_reason, @ipv_4_cidr_block_associations, @tags)
  end
end
