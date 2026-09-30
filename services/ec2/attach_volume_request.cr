private alias Core = Amazonite::Core

module Amazonite::EC2
  class AttachVolumeRequest
    # The device name (for example, `/dev/sdh` or `xvdh`).
    property device : String

    # The ID of the instance.
    property instance_id : String

    # The ID of the EBS volume. The volume and instance must be within the same Availability Zone.
    property volume_id : String

    # The index of the EBS card. Some instance types support multiple EBS cards. The default EBS card
    # index is 0.
    property ebs_card_index : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @device : String,
      @instance_id : String,
      @volume_id : String,
      @ebs_card_index : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Device", @device}

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}VolumeId", @volume_id}

      if value = @ebs_card_index
        params << {"#{prefix}EbsCardIndex", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device: Core::XMLValue.string(node.xpath_node("*[local-name()='Device']")).not_nil!,
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeId']")).not_nil!,
        ebs_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='EbsCardIndex']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@device, @instance_id, @volume_id, @ebs_card_index, @dry_run)
  end
end
