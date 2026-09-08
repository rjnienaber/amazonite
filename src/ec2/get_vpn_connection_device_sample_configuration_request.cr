private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVpnConnectionDeviceSampleConfigurationRequest
    # The `VpnConnectionId` specifies the Site-to-Site VPN connection used for the sample
    # configuration.
    property vpn_connection_id : String

    # Device identifier provided by the `GetVpnConnectionDeviceTypes` API.
    property vpn_connection_device_type_id : String

    # The IKE version to be used in the sample configuration file for your customer gateway device.
    # You can specify one of the following versions: `ikev1` or `ikev2`.
    property internet_key_exchange_version : String | Nil

    # The type of sample configuration to generate. Valid values are "compatibility" (includes IKEv1)
    # or "recommended" (throws UnsupportedOperationException for IKEv1).
    property sample_type : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpn_connection_id : String,
      @vpn_connection_device_type_id : String,
      @internet_key_exchange_version : String | Nil = nil,
      @sample_type : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}

      params << {"#{prefix}VpnConnectionDeviceTypeId", @vpn_connection_device_type_id}

      if value = @internet_key_exchange_version
        params << {"#{prefix}InternetKeyExchangeVersion", value}
      end

      if value = @sample_type
        params << {"#{prefix}SampleType", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
        vpn_connection_device_type_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionDeviceTypeId']")).not_nil!,
        internet_key_exchange_version: Core::XMLValue.string(node.xpath_node("*[local-name()='InternetKeyExchangeVersion']")),
        sample_type: Core::XMLValue.string(node.xpath_node("*[local-name()='SampleType']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_id, @vpn_connection_device_type_id, @internet_key_exchange_version, @sample_type, @dry_run)
  end
end
