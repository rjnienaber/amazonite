private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the attachment of a VPC to an internet gateway or an egress-only internet gateway.
  class InternetGatewayAttachment
    # The current state of the attachment. For an internet gateway, the state is `available` when
    # attached to a VPC; otherwise, this value is not returned.
    property state : AttachmentStatus | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @state : AttachmentStatus | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::AttachmentStatus.from_json_object_key?(n.content) : nil,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @vpc_id)
  end
end
