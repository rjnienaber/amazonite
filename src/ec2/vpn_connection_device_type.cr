private alias Core = Amazonite::Core

module Amazonite::EC2
  # List of customer gateway devices that have a sample configuration file available for use. You
  # can also see the list of device types with sample configuration files available under [Your
  # customer gateway device](https://docs.aws.amazon.com/vpn/latest/s2svpn/your-cgw.html) in the
  # *Amazon Web Services Site-to-Site VPN User Guide*.
  class VpnConnectionDeviceType
    # Customer gateway device identifier.
    property vpn_connection_device_type_id : String | Nil

    # Customer gateway device vendor.
    property vendor : String | Nil

    # Customer gateway device platform.
    property platform : String | Nil

    # Customer gateway device software version.
    property software : String | Nil

    def initialize(
      @vpn_connection_device_type_id : String | Nil = nil,
      @vendor : String | Nil = nil,
      @platform : String | Nil = nil,
      @software : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_connection_device_type_id
        params << {"#{prefix}VpnConnectionDeviceTypeId", value}
      end

      if value = @vendor
        params << {"#{prefix}Vendor", value}
      end

      if value = @platform
        params << {"#{prefix}Platform", value}
      end

      if value = @software
        params << {"#{prefix}Software", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_device_type_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnConnectionDeviceTypeId']")),
        vendor: Core::XMLValue.string(node.xpath_node("*[local-name()='vendor']")),
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='platform']")),
        software: Core::XMLValue.string(node.xpath_node("*[local-name()='software']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_device_type_id, @vendor, @platform, @software)
  end
end
