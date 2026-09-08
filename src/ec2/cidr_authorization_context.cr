private alias Core = Amazonite::Core

module Amazonite::EC2
  # Provides authorization for Amazon to bring a specific IP address range to a specific Amazon Web
  # Services account using bring your own IP addresses (BYOIP). For more information, see
  # [Configuring your BYOIP address
  # range](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#prepare-for-byoip) in
  # the *Amazon EC2 User Guide*.
  class CidrAuthorizationContext
    # The plain-text authorization message for the prefix and account.
    property message : String

    # The signed authorization message for the prefix and account.
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
