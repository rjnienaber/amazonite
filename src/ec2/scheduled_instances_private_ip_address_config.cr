private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a private IPv4 address for a Scheduled Instance.
  class ScheduledInstancesPrivateIpAddressConfig
    # Indicates whether this is a primary IPv4 address. Otherwise, this is a secondary IPv4 address.
    property primary : Bool | Nil

    # The IPv4 address.
    property private_ip_address : String | Nil

    def initialize(
      @primary : Bool | Nil = nil,
      @private_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @primary
        params << {"#{prefix}Primary", Core::QueryValue.bool(value)}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        primary: Core::XMLValue.bool(node.xpath_node("*[local-name()='Primary']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateIpAddress']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@primary, @private_ip_address)
  end
end
