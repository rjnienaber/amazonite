private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of AttachNetworkInterface.
  class AttachNetworkInterfaceResult
    # The ID of the network interface attachment.
    property attachment_id : String | Nil

    # The index of the network card.
    property network_card_index : Int32 | Nil

    def initialize(
      @attachment_id : String | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attachment_id
        params << {"#{prefix}AttachmentId", value}
      end

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")),
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='networkCardIndex']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attachment_id, @network_card_index)
  end
end
