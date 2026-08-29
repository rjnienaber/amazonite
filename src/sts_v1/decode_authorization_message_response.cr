private alias Core = Amazonite::Core

module Amazonite::StsV1
  class DecodeAuthorizationMessageResponse
    property decoded_message : String | Nil

    def initialize(
      @decoded_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @decoded_message
        params << {"#{prefix}DecodedMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        decoded_message: Core::XMLValue.string(node.xpath_node("*[local-name()='DecodedMessage']")),
      )
    end
  end
end
