private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class PublishResponse
    property message_id : String | Nil

    property sequence_number : String | Nil

    def initialize(
      @message_id : String | Nil = nil,
      @sequence_number : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @message_id
        params << {"#{prefix}MessageId", value}
      end

      if value = @sequence_number
        params << {"#{prefix}SequenceNumber", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message_id: Core::XMLValue.string(node.xpath_node("*[local-name()='MessageId']")),
        sequence_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SequenceNumber']")),
      )
    end
  end
end
