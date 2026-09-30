private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the IP addresses and network interface associated with a NAT gateway.
  class NatGatewayAddress
    # [Public NAT gateway only] The allocation ID of the Elastic IP address that's associated with the
    # NAT gateway.
    property allocation_id : String | Nil

    # The ID of the network interface associated with the NAT gateway.
    property network_interface_id : String | Nil

    # The private IP address associated with the NAT gateway.
    property private_ip : String | Nil

    # [Public NAT gateway only] The Elastic IP address associated with the NAT gateway.
    property public_ip : String | Nil

    # [Public NAT gateway only] The association ID of the Elastic IP address that's associated with
    # the NAT gateway.
    property association_id : String | Nil

    # Defines if the IP address is the primary address.
    property is_primary : Bool | Nil

    # The address failure message.
    property failure_message : String | Nil

    # The address status.
    property status : NatGatewayAddressStatus | Nil

    # The Availability Zone where this Elastic IP address (EIP) is being used to handle outbound NAT
    # traffic.
    property availability_zone : String | Nil

    # The ID of the Availability Zone where this Elastic IP address (EIP) is being used to handle
    # outbound NAT traffic. Use this instead of AvailabilityZone for consistent identification of AZs
    # across Amazon Web Services Regions.
    property availability_zone_id : String | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @private_ip : String | Nil = nil,
      @public_ip : String | Nil = nil,
      @association_id : String | Nil = nil,
      @is_primary : Bool | Nil = nil,
      @failure_message : String | Nil = nil,
      @status : NatGatewayAddressStatus | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @private_ip
        params << {"#{prefix}PrivateIp", value}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @is_primary
        params << {"#{prefix}IsPrimary", Core::QueryValue.bool(value)}
      end

      if value = @failure_message
        params << {"#{prefix}FailureMessage", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        private_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIp']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        is_primary: Core::XMLValue.bool(node.xpath_node("*[local-name()='isPrimary']")),
        failure_message: Core::XMLValue.string(node.xpath_node("*[local-name()='failureMessage']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::NatGatewayAddressStatus.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @network_interface_id, @private_ip, @public_ip, @association_id, @is_primary, @failure_message, @status, @availability_zone, @availability_zone_id)
  end
end
