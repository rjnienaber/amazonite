private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the attachment of a secondary interface to an instance.
  class SecondaryInterfaceAttachment
    # The ID of the attachment.
    property attachment_id : String | Nil

    # The timestamp when the attachment was created.
    property attach_time : Time | Nil

    # Indicates whether the secondary interface is deleted when the instance is terminated.
    #
    # The only supported value for this field is `true`.
    property delete_on_termination : Bool | Nil

    # The device index of the secondary interface.
    property device_index : Int32 | Nil

    # The ID of the instance to which the secondary interface is attached.
    property instance_id : String | Nil

    # The Amazon Web Services account ID of the owner of the instance.
    property instance_owner_id : String | Nil

    # The index of the network card.
    property network_card_index : Int32 | Nil

    # The attachment state.
    property status : AttachmentStatus | Nil

    def initialize(
      @attachment_id : String | Nil = nil,
      @attach_time : Time | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_owner_id : String | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
      @status : AttachmentStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attachment_id
        params << {"#{prefix}AttachmentId", value}
      end

      if value = @attach_time
        params << {"#{prefix}AttachTime", Core::QueryValue.time(value)}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @device_index
        params << {"#{prefix}DeviceIndex", value.to_s}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_owner_id
        params << {"#{prefix}InstanceOwnerId", value}
      end

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")),
        attach_time: Core::XMLValue.time(node.xpath_node("*[local-name()='attachTime']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceOwnerId']")),
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='networkCardIndex']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::AttachmentStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attachment_id, @attach_time, @delete_on_termination, @device_index, @instance_id, @instance_owner_id, @network_card_index, @status)
  end
end
