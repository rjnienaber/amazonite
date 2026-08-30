private alias Core = Amazonite::Core

module Amazonite::StsV1
  class DecodeAuthorizationMessageRequest
    # The encoded message that was returned with the response.
    property encoded_message : String

    def initialize(
      @encoded_message : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EncodedMessage", @encoded_message}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        encoded_message: Core::XMLValue.string(node.xpath_node("*[local-name()='EncodedMessage']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @encoded_message
        raise Core::ValidationError.new("EncodedMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EncodedMessage length must be <= 10240") if value.size > 10240
      end
    end

    def_equals_and_hash(@encoded_message)
  end
end
