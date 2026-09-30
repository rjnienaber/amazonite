private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a secondary interface specification for launching an instance.
  class InstanceSecondaryInterfaceSpecificationRequest
    # Indicates whether the secondary interface is deleted when the instance is terminated.
    #
    # The only supported value for this field is `true`.
    property delete_on_termination : Bool | Nil

    # The device index for the secondary interface attachment.
    property device_index : Int32 | Nil

    # The private IPv4 addresses to assign to the secondary interface.
    property private_ip_addresses : Array(InstanceSecondaryInterfacePrivateIpAddressRequest) | Nil

    # The number of private IPv4 addresses to assign to the secondary interface.
    property private_ip_address_count : Int32 | Nil

    # The ID of the secondary subnet.
    property secondary_subnet_id : String | Nil

    # The type of secondary interface.
    property interface_type : SecondaryInterfaceType | Nil

    # The index of the network card. The network card must support secondary interfaces.
    property network_card_index : Int32 | Nil

    def initialize(
      @delete_on_termination : Bool | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @private_ip_addresses : Array(InstanceSecondaryInterfacePrivateIpAddressRequest) | Nil = nil,
      @private_ip_address_count : Int32 | Nil = nil,
      @secondary_subnet_id : String | Nil = nil,
      @interface_type : SecondaryInterfaceType | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @device_index
        params << {"#{prefix}DeviceIndex", value.to_s}
      end

      (@private_ip_addresses || [] of InstanceSecondaryInterfacePrivateIpAddressRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddress.#{i}."))
      end

      if value = @private_ip_address_count
        params << {"#{prefix}PrivateIpAddressCount", value.to_s}
      end

      if value = @secondary_subnet_id
        params << {"#{prefix}SecondarySubnetId", value}
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value.to_json_object_key}
      end

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteOnTermination']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='DeviceIndex']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='PrivateIpAddress']/*[local-name()='item']").map { |n| InstanceSecondaryInterfacePrivateIpAddressRequest.from_xml(n) },
        private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PrivateIpAddressCount']")),
        secondary_subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SecondarySubnetId']")),
        interface_type: (n = node.xpath_node("*[local-name()='InterfaceType']")) ? AEC::SecondaryInterfaceType.from_json_object_key?(n.content) : nil,
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='NetworkCardIndex']")),
      )
    end

    def validate! : Nil
      if value = @private_ip_addresses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@delete_on_termination, @device_index, @private_ip_addresses, @private_ip_address_count, @secondary_subnet_id, @interface_type, @network_card_index)
  end
end
