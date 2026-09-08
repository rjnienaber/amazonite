private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a parameter used to set up an EBS volume in a block device mapping.
  class EbsInstanceBlockDevice
    # The time stamp when the attachment initiated.
    property attach_time : Time | Nil

    # Indicates whether the volume is deleted on instance termination.
    property delete_on_termination : Bool | Nil

    # The attachment state.
    property status : AttachmentStatus | Nil

    # The ID of the EBS volume.
    property volume_id : String | Nil

    # The ARN of the Amazon Web Services-managed resource to which the volume is attached.
    property associated_resource : String | Nil

    # The ID of the Amazon Web Services account that owns the volume.
    #
    # This parameter is returned only for volumes that are attached to Amazon Web Services-managed
    # resources.
    property volume_owner_id : String | Nil

    # The service provider that manages the EBS volume.
    property operator : OperatorResponse | Nil

    # The index of the EBS card. Some instance types support multiple EBS cards. The default EBS card
    # index is 0.
    property ebs_card_index : Int32 | Nil

    def initialize(
      @attach_time : Time | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @status : AttachmentStatus | Nil = nil,
      @volume_id : String | Nil = nil,
      @associated_resource : String | Nil = nil,
      @volume_owner_id : String | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @ebs_card_index : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attach_time
        params << {"#{prefix}AttachTime", Core::QueryValue.time(value)}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @associated_resource
        params << {"#{prefix}AssociatedResource", value}
      end

      if value = @volume_owner_id
        params << {"#{prefix}VolumeOwnerId", value}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      if value = @ebs_card_index
        params << {"#{prefix}EbsCardIndex", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attach_time: Core::XMLValue.time(node.xpath_node("*[local-name()='attachTime']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::AttachmentStatus.from_json_object_key?(n.content) : nil,
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        associated_resource: Core::XMLValue.string(node.xpath_node("*[local-name()='associatedResource']")),
        volume_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeOwnerId']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        ebs_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='ebsCardIndex']")),
      )
    end

    def validate! : Nil
      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@attach_time, @delete_on_termination, @status, @volume_id, @associated_resource, @volume_owner_id, @operator, @ebs_card_index)
  end
end
