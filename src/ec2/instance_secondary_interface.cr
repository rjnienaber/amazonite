private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a secondary interface attached to an instance.
  class InstanceSecondaryInterface
    # The attachment information for the secondary interface.
    property attachment : InstanceSecondaryInterfaceAttachment | Nil

    # The MAC address of the secondary interface.
    property mac_address : String | Nil

    # The ID of the secondary interface.
    property secondary_interface_id : String | Nil

    # The Amazon Web Services account ID of the owner of the secondary interface.
    property owner_id : String | Nil

    # The private IPv4 addresses associated with the secondary interface.
    property private_ip_addresses : Array(InstanceSecondaryInterfacePrivateIpAddress) | Nil

    # Indicates whether source/destination checking is enabled.
    property source_dest_check : Bool | Nil

    # The status of the secondary interface.
    property status : SecondaryInterfaceStatus | Nil

    # The ID of the secondary subnet.
    property secondary_subnet_id : String | Nil

    # The ID of the secondary network.
    property secondary_network_id : String | Nil

    # The type of secondary interface.
    property interface_type : SecondaryInterfaceType | Nil

    def initialize(
      @attachment : InstanceSecondaryInterfaceAttachment | Nil = nil,
      @mac_address : String | Nil = nil,
      @secondary_interface_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @private_ip_addresses : Array(InstanceSecondaryInterfacePrivateIpAddress) | Nil = nil,
      @source_dest_check : Bool | Nil = nil,
      @status : SecondaryInterfaceStatus | Nil = nil,
      @secondary_subnet_id : String | Nil = nil,
      @secondary_network_id : String | Nil = nil,
      @interface_type : SecondaryInterfaceType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attachment
        params.concat(value.to_query_params("#{prefix}Attachment."))
      end

      if value = @mac_address
        params << {"#{prefix}MacAddress", value}
      end

      if value = @secondary_interface_id
        params << {"#{prefix}SecondaryInterfaceId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@private_ip_addresses || [] of InstanceSecondaryInterfacePrivateIpAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddressSet.#{i}."))
      end

      if value = @source_dest_check
        params << {"#{prefix}SourceDestCheck", Core::QueryValue.bool(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @secondary_subnet_id
        params << {"#{prefix}SecondarySubnetId", value}
      end

      if value = @secondary_network_id
        params << {"#{prefix}SecondaryNetworkId", value}
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attachment: node.xpath_node("*[local-name()='attachment']").try { |n| InstanceSecondaryInterfaceAttachment.from_xml(n) },
        mac_address: Core::XMLValue.string(node.xpath_node("*[local-name()='macAddress']")),
        secondary_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryInterfaceId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddressSet']/*[local-name()='item']").map { |n| InstanceSecondaryInterfacePrivateIpAddress.from_xml(n) },
        source_dest_check: Core::XMLValue.bool(node.xpath_node("*[local-name()='sourceDestCheck']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SecondaryInterfaceStatus.from_json_object_key?(n.content) : nil,
        secondary_subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondarySubnetId']")),
        secondary_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='secondaryNetworkId']")),
        interface_type: (n = node.xpath_node("*[local-name()='interfaceType']")) ? AEC::SecondaryInterfaceType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @attachment
        value.validate!
      end

      if value = @private_ip_addresses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@attachment, @mac_address, @secondary_interface_id, @owner_id, @private_ip_addresses, @source_dest_check, @status, @secondary_subnet_id, @secondary_network_id, @interface_type)
  end
end
