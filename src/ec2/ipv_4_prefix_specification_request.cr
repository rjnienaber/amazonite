private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the IPv4 prefix option for a network interface.
  class Ipv4PrefixSpecificationRequest
    # The IPv4 prefix. For information, see [ Assigning prefixes to network
    # interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-prefix-eni.html) in the
    # *Amazon EC2 User Guide*.
    property ipv_4_prefix : String | Nil

    def initialize(
      @ipv_4_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_4_prefix
        params << {"#{prefix}Ipv4Prefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_4_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv4Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_4_prefix)
  end
end
