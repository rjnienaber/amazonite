private alias Core = Amazonite::Core

module Amazonite::StsV1
  # A document that contains additional information about the authorization status of a request from
  # an encoded message that is returned in response to an Amazon Web Services request.
  class DecodeAuthorizationMessageResponse
    # The API returns a response with the decoded message.
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

    def validate! : Nil
    end

    def_equals_and_hash(@decoded_message)
  end
end
