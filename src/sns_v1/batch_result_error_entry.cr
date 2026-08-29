private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class BatchResultErrorEntry
    property id : String

    property code : String

    property message : String | Nil

    property sender_fault : Bool

    def initialize(
      @id : String,
      @code : String,
      @sender_fault : Bool,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Id", @id}

      params << {"#{prefix}Code", @code}

      if value = @message
        params << {"#{prefix}Message", value}
      end

      params << {"#{prefix}SenderFault", Core::QueryValue.bool(@sender_fault)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='Code']")).not_nil!,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='Message']")),
        sender_fault: Core::XMLValue.bool(node.xpath_node("*[local-name()='SenderFault']")).not_nil!,
      )
    end
  end
end
