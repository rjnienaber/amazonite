private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a secondary interface.
  class SecondaryInterface
    # The Availability Zone of the secondary interface.
    property availability_zone : String | Nil

    # The ID of the Availability Zone of the secondary interface.
    property availability_zone_id : String | Nil

    # The attachment information for the secondary interface.
    property attachment : SecondaryInterfaceAttachment | Nil

    # The MAC address of the secondary interface.
    property mac_address : String | Nil

    # The ID of the Amazon Web Services account that owns the secondary interface.
    property owner_id : String | Nil

    # The private IPv4 addresses associated with the secondary interface.
    property private_ipv_4_addresses : Array(SecondaryInterfaceIpv4Address) | Nil

    # The ID of the secondary interface.
    property secondary_interface_id : String | Nil

    # The Amazon Resource Name (ARN) of the secondary interface.
    property secondary_interface_arn : String | Nil

    # The type of secondary interface.
    property secondary_interface_type : SecondaryInterfaceType | Nil

    # The ID of the secondary subnet.
    property secondary_subnet_id : String | Nil

    # The ID of the secondary network.
    property secondary_network_id : String | Nil

    # The type of the secondary network.
    property secondary_network_type : SecondaryNetworkType | Nil

    # Indicates whether source/destination checking is enabled.
    property source_dest_check : Bool | Nil

    # The status of the secondary interface.
    property status : SecondaryInterfaceStatus | Nil

    # The tags assigned to the secondary interface.
    property tags : Array(Tag) | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @attachment : SecondaryInterfaceAttachment | Nil = nil,
      @mac_address : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @private_ipv_4_addresses : Array(SecondaryInterfaceIpv4Address) | Nil = nil,
      @secondary_interface_id : String | Nil = nil,
      @secondary_interface_arn : String | Nil = nil,
      @secondary_interface_type : SecondaryInterfaceType | Nil = nil,
      @secondary_subnet_id : String | Nil = nil,
      @secondary_network_id : String | Nil = nil,
      @secondary_network_type : SecondaryNetworkType | Nil = nil,
      @source_dest_check : Bool | Nil = nil,
      @status : SecondaryInterfaceStatus | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @attachment
        params.concat(value.to_query_params("#{prefix}Attachment."))
      end

      if value = @mac_address
        params << {"#{prefix}MacAddress", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@private_ipv_4_addresses || [] of SecondaryInterfaceIpv4Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpv4AddressSet.#{i}."))
      end

      if value = @secondary_interface_id
        params << {"#{prefix}SecondaryInterfaceId", value}
      end

      if value = @secondary_interface_arn
        params << {"#{prefix}SecondaryInterfaceArn", value}
      end

      if value = @secondary_interface_type
        params << {"#{prefix}SecondaryInterfaceType", value.to_json_object_key}
      end

      if value = @secondary_subnet_id
        params << {"#{prefix}SecondarySubnetId", value}
      end

      if value = @secondary_network_id
        params << {"#{prefix}SecondaryNetworkId", value}
      end

      if value = @secondary_network_type
        params << {"#{prefix}SecondaryNetworkType", value.to_json_object_key}
      end

      if value = @source_dest_check
        params << {"#{prefix}SourceDestCheck", Core::QueryValue.bool(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        attachment: node.xpath_node("*[local-name()='attachment']").try { |n| SecondaryInterfaceAttachment.from_xml(n) },
        mac_address: Core::XMLValue.string(node.xpath_node("*[local-name()='macAddress']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        private_ipv_4_addresses: node.xpath_nodes("*[local-name()='privateIpv4AddressSet']/*[local-name()='item']").map { |n| SecondaryInterfaceIpv4Address.from_xml(n) },
        secondary_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryInterfaceId']")),
        secondary_interface_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryInterfaceArn']")),
        secondary_interface_type: (n = node.xpath_node("*[local-name()='secondaryInterfaceType']")) ? AEC::SecondaryInterfaceType.from_json_object_key?(n.content) : nil,
        secondary_subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondarySubnetId']")),
        secondary_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryNetworkId']")),
        secondary_network_type: (n = node.xpath_node("*[local-name()='secondaryNetworkType']")) ? AEC::SecondaryNetworkType.from_json_object_key?(n.content) : nil,
        source_dest_check: Core::XMLValue.bool(node.xpath_node("*[local-name()='sourceDestCheck']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SecondaryInterfaceStatus.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @attachment
        value.validate!
      end

      if value = @private_ipv_4_addresses
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @attachment, @mac_address, @owner_id, @private_ipv_4_addresses, @secondary_interface_id, @secondary_interface_arn, @secondary_interface_type, @secondary_subnet_id, @secondary_network_id, @secondary_network_type, @source_dest_check, @status, @tags)
  end
end
