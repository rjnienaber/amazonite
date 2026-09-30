private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateAddressRequest
    # The allocation ID. This is required.
    property allocation_id : String | Nil

    # The ID of the instance. The instance must have exactly one attached network interface. You can
    # specify either the instance ID or the network interface ID, but not both.
    property instance_id : String | Nil

    # Deprecated.
    property public_ip : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network interface. If the instance has more than one network interface, you must
    # specify a network interface ID.
    #
    # You can specify either the instance ID or the network interface ID, but not both.
    property network_interface_id : String | Nil

    # The primary or secondary private IP address to associate with the Elastic IP address. If no
    # private IP address is specified, the Elastic IP address is associated with the primary private
    # IP address.
    property private_ip_address : String | Nil

    # Reassociation is automatic, but you can specify false to ensure the operation fails if the
    # Elastic IP address is already associated with another resource.
    property allow_reassociation : Bool | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @public_ip : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @allow_reassociation : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      if value = @allow_reassociation
        params << {"#{prefix}AllowReassociation", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicIp']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        allow_reassociation: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowReassociation']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @instance_id, @public_ip, @dry_run, @network_interface_id, @private_ip_address, @allow_reassociation)
  end
end
