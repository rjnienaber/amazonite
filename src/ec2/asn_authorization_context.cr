private alias Core = Amazonite::Core

module Amazonite::EC2
  # Provides authorization for Amazon to bring an Autonomous System Number (ASN) to a specific
  # Amazon Web Services account using bring your own ASN (BYOASN). For details on the format of the
  # message and signature, see [Tutorial: Bring your ASN to
  # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/tutorials-byoasn.html) in the *Amazon VPC IPAM
  # guide*.
  class AsnAuthorizationContext
    # The authorization context's message.
    property message : String

    # The authorization context's signature.
    property signature : String

    def initialize(
      @message : String,
      @signature : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Message", @message}

      params << {"#{prefix}Signature", @signature}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='Message']")).not_nil!,
        signature: Core::XMLValue.string(node.xpath_node("*[local-name()='Signature']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@message, @signature)
  end
end
