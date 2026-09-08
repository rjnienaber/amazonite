private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes volume attachment details.
  class VolumeAttachment
    # Indicates whether the EBS volume is deleted on instance termination.
    property delete_on_termination : Bool | Nil

    # The ARN of the Amazon Web Services-managed resource to which the volume is attached.
    property associated_resource : String | Nil

    # The service principal of the Amazon Web Services service that owns the underlying resource to
    # which the volume is attached.
    #
    # This parameter is returned only for volumes that are attached to Amazon Web Services-managed
    # resources.
    property instance_owning_service : String | Nil

    # The index of the EBS card. Some instance types support multiple EBS cards. The default EBS card
    # index is 0.
    property ebs_card_index : Int32 | Nil

    # The ID of the volume.
    property volume_id : String | Nil

    # The ID of the instance.
    #
    # If the volume is attached to an Amazon Web Services-managed resource, this parameter returns
    # `null`.
    property instance_id : String | Nil

    # The device name.
    #
    # If the volume is attached to an Amazon Web Services-managed resource, this parameter returns
    # `null`.
    property device : String | Nil

    # The attachment state of the volume.
    property state : VolumeAttachmentState | Nil

    # The time stamp when the attachment initiated.
    property attach_time : Time | Nil

    def initialize(
      @delete_on_termination : Bool | Nil = nil,
      @associated_resource : String | Nil = nil,
      @instance_owning_service : String | Nil = nil,
      @ebs_card_index : Int32 | Nil = nil,
      @volume_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @device : String | Nil = nil,
      @state : VolumeAttachmentState | Nil = nil,
      @attach_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @associated_resource
        params << {"#{prefix}AssociatedResource", value}
      end

      if value = @instance_owning_service
        params << {"#{prefix}InstanceOwningService", value}
      end

      if value = @ebs_card_index
        params << {"#{prefix}EbsCardIndex", value.to_s}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @device
        params << {"#{prefix}Device", value}
      end

      if value = @state
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @attach_time
        params << {"#{prefix}AttachTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        associated_resource: Core::XMLValue.string(node.xpath_node("*[local-name()='associatedResource']")),
        instance_owning_service: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceOwningService']")),
        ebs_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='ebsCardIndex']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        device: Core::XMLValue.string(node.xpath_node("*[local-name()='device']")),
        state: (n = node.xpath_node("*[local-name()='status']")) ? AEC::VolumeAttachmentState.from_json_object_key?(n.content) : nil,
        attach_time: Core::XMLValue.time(node.xpath_node("*[local-name()='attachTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@delete_on_termination, @associated_resource, @instance_owning_service, @ebs_card_index, @volume_id, @instance_id, @device, @state, @attach_time)
  end
end
