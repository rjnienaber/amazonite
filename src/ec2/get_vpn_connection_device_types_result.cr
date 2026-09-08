private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVpnConnectionDeviceTypesResult
    # List of customer gateway devices that have a sample configuration file available for use.
    property vpn_connection_device_types : Array(VpnConnectionDeviceType) | Nil

    # The `NextToken` value to include in a future `GetVpnConnectionDeviceTypes` request. When the
    # results of a `GetVpnConnectionDeviceTypes` request exceed `MaxResults`, this value can be used
    # to retrieve the next page of results. This value is null when there are no more results to
    # return.
    property next_token : String | Nil

    def initialize(
      @vpn_connection_device_types : Array(VpnConnectionDeviceType) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpn_connection_device_types || [] of VpnConnectionDeviceType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpnConnectionDeviceTypeSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_device_types: node.xpath_nodes("*[local-name()='vpnConnectionDeviceTypeSet']/*[local-name()='item']").map { |n| VpnConnectionDeviceType.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpn_connection_device_types
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpn_connection_device_types, @next_token)
  end
end
