private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an attachment between a virtual private gateway and a VPC.
  class VpcAttachment
    # The ID of the VPC.
    property vpc_id : String | Nil

    # The current state of the attachment.
    property state : AttachmentStatus | Nil

    def initialize(
      @vpc_id : String | Nil = nil,
      @state : AttachmentStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::AttachmentStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpc_id, @state)
  end
end
