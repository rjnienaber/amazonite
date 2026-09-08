private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a private IPv4 address for a secondary interface request.
  class InstanceSecondaryInterfacePrivateIpAddressRequest
    # The private IPv4 address.
    property private_ip_address : String

    def initialize(
      @private_ip_address : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PrivateIpAddress", @private_ip_address}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateIpAddress']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@private_ip_address)
  end
end
