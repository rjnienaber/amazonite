private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for AttachNetworkInterface.
  class AttachNetworkInterfaceRequest
    # The index of the network card. Some instance types support multiple network cards. The primary
    # network interface must be assigned to network card index 0. The default is network card index 0.
    property network_card_index : Int32 | Nil

    # Configures ENA Express for the network interface that this action attaches to the instance.
    property ena_srd_specification : EnaSrdSpecification | Nil

    # The number of ENA queues to be created with the instance.
    property ena_queue_count : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The ID of the instance.
    property instance_id : String

    # The index of the device for the network interface attachment.
    property device_index : Int32

    def initialize(
      @network_interface_id : String,
      @instance_id : String,
      @device_index : Int32,
      @network_card_index : Int32 | Nil = nil,
      @ena_srd_specification : EnaSrdSpecification | Nil = nil,
      @ena_queue_count : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end

      if value = @ena_srd_specification
        params.concat(value.to_query_params("#{prefix}EnaSrdSpecification."))
      end

      if value = @ena_queue_count
        params << {"#{prefix}EnaQueueCount", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}DeviceIndex", @device_index.to_s}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='NetworkCardIndex']")),
        ena_srd_specification: node.xpath_node("*[local-name()='EnaSrdSpecification']").try { |n| EnaSrdSpecification.from_xml(n) },
        ena_queue_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='EnaQueueCount']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")).not_nil!,
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @ena_srd_specification
        value.validate!
      end
    end

    def_equals_and_hash(@network_card_index, @ena_srd_specification, @ena_queue_count, @dry_run, @network_interface_id, @instance_id, @device_index)
  end
end
