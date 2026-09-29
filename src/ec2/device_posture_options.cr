private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the device posture options for a Client VPN endpoint. Device posture options specify
  # the device trust providers that the endpoint uses to evaluate the security posture of connecting
  # devices.
  class DevicePostureOptions
    # The device trust providers to configure for the Client VPN endpoint.
    property trust_providers : Array(ClientVpnTrustProviderRequest) | Nil

    # Indicates whether device posture evaluation is enabled for the Client VPN endpoint. Specify
    # `false` to disable device posture, which clears the configured device trust providers.
    property enabled : Bool | Nil

    def initialize(
      @trust_providers : Array(ClientVpnTrustProviderRequest) | Nil = nil,
      @enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@trust_providers || [] of ClientVpnTrustProviderRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TrustProvider.#{i}."))
      end

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        trust_providers: node.xpath_nodes("*[local-name()='TrustProvider']/*[local-name()='item']").map { |n| ClientVpnTrustProviderRequest.from_xml(n) },
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
      )
    end

    def validate! : Nil
      if value = @trust_providers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@trust_providers, @enabled)
  end
end
