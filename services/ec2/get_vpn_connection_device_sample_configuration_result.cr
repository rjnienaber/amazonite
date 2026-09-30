private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVpnConnectionDeviceSampleConfigurationResult
    # Sample configuration file for the specified customer gateway device.
    property vpn_connection_device_sample_configuration : String | Nil

    def initialize(
      @vpn_connection_device_sample_configuration : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_connection_device_sample_configuration
        params << {"#{prefix}VpnConnectionDeviceSampleConfiguration", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_device_sample_configuration: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnConnectionDeviceSampleConfiguration']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_device_sample_configuration)
  end
end
