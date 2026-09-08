private alias Core = Amazonite::Core

module Amazonite::EC2
  # A signed document that proves that you are authorized to bring the specified IP address range to
  # Amazon using BYOIP.
  class IpamCidrAuthorizationContext
    # The plain-text authorization message for the prefix and account.
    property message : String | Nil

    # The signed authorization message for the prefix and account.
    property signature : String | Nil

    def initialize(
      @message : String | Nil = nil,
      @signature : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @message
        params << {"#{prefix}Message", value}
      end

      if value = @signature
        params << {"#{prefix}Signature", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='Message']")),
        signature: Core::XMLValue.string(node.xpath_node("*[local-name()='Signature']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@message, @signature)
  end
end
