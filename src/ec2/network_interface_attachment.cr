private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network interface attachment.
  class NetworkInterfaceAttachment
    # The timestamp indicating when the attachment initiated.
    property attach_time : Time | Nil

    # The ID of the network interface attachment.
    property attachment_id : String | Nil

    # Indicates whether the network interface is deleted when the instance is terminated.
    property delete_on_termination : Bool | Nil

    # The device index of the network interface attachment on the instance.
    property device_index : Int32 | Nil

    # The index of the network card.
    property network_card_index : Int32 | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # The Amazon Web Services account ID of the owner of the instance.
    property instance_owner_id : String | Nil

    # The attachment state.
    property status : AttachmentStatus | Nil

    # Configures ENA Express for the network interface that this action attaches to the instance.
    property ena_srd_specification : AttachmentEnaSrdSpecification | Nil

    # The number of ENA queues created with the instance.
    property ena_queue_count : Int32 | Nil

    def initialize(
      @attach_time : Time | Nil = nil,
      @attachment_id : String | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_owner_id : String | Nil = nil,
      @status : AttachmentStatus | Nil = nil,
      @ena_srd_specification : AttachmentEnaSrdSpecification | Nil = nil,
      @ena_queue_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attach_time
        params << {"#{prefix}AttachTime", Core::QueryValue.time(value)}
      end

      if value = @attachment_id
        params << {"#{prefix}AttachmentId", value}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @device_index
        params << {"#{prefix}DeviceIndex", value.to_s}
      end

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_owner_id
        params << {"#{prefix}InstanceOwnerId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @ena_srd_specification
        params.concat(value.to_query_params("#{prefix}EnaSrdSpecification."))
      end

      if value = @ena_queue_count
        params << {"#{prefix}EnaQueueCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attach_time: Core::XMLValue.time(node.xpath_node("*[local-name()='attachTime']")),
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")),
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='networkCardIndex']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceOwnerId']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::AttachmentStatus.from_json_object_key?(n.content) : nil,
        ena_srd_specification: node.xpath_node("*[local-name()='enaSrdSpecification']").try { |n| AttachmentEnaSrdSpecification.from_xml(n) },
        ena_queue_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='enaQueueCount']")),
      )
    end

    def validate! : Nil
      if value = @ena_srd_specification
        value.validate!
      end
    end

    def_equals_and_hash(@attach_time, @attachment_id, @delete_on_termination, @device_index, @network_card_index, @instance_id, @instance_owner_id, @status, @ena_srd_specification, @ena_queue_count)
  end
end
