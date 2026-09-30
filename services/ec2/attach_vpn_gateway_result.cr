private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of AttachVpnGateway.
  class AttachVpnGatewayResult
    # Information about the attachment.
    property vpc_attachment : VpcAttachment | Nil

    def initialize(
      @vpc_attachment : VpcAttachment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_attachment
        params.concat(value.to_query_params("#{prefix}Attachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_attachment: node.xpath_node("*[local-name()='attachment']").try { |n| VpcAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpc_attachment
        value.validate!
      end
    end

    def_equals_and_hash(@vpc_attachment)
  end
end
