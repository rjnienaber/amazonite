private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a secondary subnet.
  class SecondarySubnet
    # The ID of the secondary subnet.
    property secondary_subnet_id : String | Nil

    # The Amazon Resource Name (ARN) of the secondary subnet.
    property secondary_subnet_arn : String | Nil

    # The ID of the secondary network.
    property secondary_network_id : String | Nil

    # The type of the secondary network.
    property secondary_network_type : SecondaryNetworkType | Nil

    # The ID of the Amazon Web Services account that owns the secondary subnet.
    property owner_id : String | Nil

    # The ID of the Availability Zone of the secondary subnet.
    property availability_zone_id : String | Nil

    # The Availability Zone of the secondary subnet.
    property availability_zone : String | Nil

    # Information about the IPv4 CIDR blocks associated with the secondary subnet.
    property ipv_4_cidr_block_associations : Array(SecondarySubnetIpv4CidrBlockAssociation) | Nil

    # The state of the secondary subnet.
    property state : SecondarySubnetState | Nil

    # The reason for the current state of the secondary subnet.
    property state_reason : String | Nil

    # The tags assigned to the secondary subnet.
    property tags : Array(Tag) | Nil

    def initialize(
      @secondary_subnet_id : String | Nil = nil,
      @secondary_subnet_arn : String | Nil = nil,
      @secondary_network_id : String | Nil = nil,
      @secondary_network_type : SecondaryNetworkType | Nil = nil,
      @owner_id : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @ipv_4_cidr_block_associations : Array(SecondarySubnetIpv4CidrBlockAssociation) | Nil = nil,
      @state : SecondarySubnetState | Nil = nil,
      @state_reason : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @secondary_subnet_id
        params << {"#{prefix}SecondarySubnetId", value}
      end

      if value = @secondary_subnet_arn
        params << {"#{prefix}SecondarySubnetArn", value}
      end

      if value = @secondary_network_id
        params << {"#{prefix}SecondaryNetworkId", value}
      end

      if value = @secondary_network_type
        params << {"#{prefix}SecondaryNetworkType", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      (@ipv_4_cidr_block_associations || [] of SecondarySubnetIpv4CidrBlockAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4CidrBlockAssociationSet.#{i}."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_reason
        params << {"#{prefix}StateReason", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondarySubnetId']")),
        secondary_subnet_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='secondarySubnetArn']")),
        secondary_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryNetworkId']")),
        secondary_network_type: (n = node.xpath_node("*[local-name()='secondaryNetworkType']")) ? AEC::SecondaryNetworkType.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        ipv_4_cidr_block_associations: node.xpath_nodes("*[local-name()='ipv4CidrBlockAssociationSet']/*[local-name()='item']").map { |n| SecondarySubnetIpv4CidrBlockAssociation.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SecondarySubnetState.from_json_object_key?(n.content) : nil,
        state_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateReason']")),
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

    def_equals_and_hash(@secondary_subnet_id, @secondary_subnet_arn, @secondary_network_id, @secondary_network_type, @owner_id, @availability_zone_id, @availability_zone, @ipv_4_cidr_block_associations, @state, @state_reason, @tags)
  end
end
