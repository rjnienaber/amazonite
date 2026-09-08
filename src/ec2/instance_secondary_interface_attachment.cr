private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the attachment of a secondary interface to an instance.
  class InstanceSecondaryInterfaceAttachment
    # The timestamp when the attachment was created.
    property attach_time : Time | Nil

    # The ID of the attachment.
    property attachment_id : String | Nil

    # Indicates whether the secondary interface is deleted when the instance is terminated.
    #
    # The only supported value for this field is `true`.
    property delete_on_termination : Bool | Nil

    # The device index of the secondary interface.
    property device_index : Int32 | Nil

    # The attachment state.
    property status : AttachmentStatus | Nil

    # The index of the network card.
    property network_card_index : Int32 | Nil

    def initialize(
      @attach_time : Time | Nil = nil,
      @attachment_id : String | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @status : AttachmentStatus | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
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

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attach_time: Core::XMLValue.time(node.xpath_node("*[local-name()='attachTime']")),
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::AttachmentStatus.from_json_object_key?(n.content) : nil,
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='networkCardIndex']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attach_time, @attachment_id, @delete_on_termination, @device_index, @status, @network_card_index)
  end
end
