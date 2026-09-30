private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the device posture options for a Client VPN endpoint.
  class DevicePostureResponseOptions
    # The device trust providers configured for the Client VPN endpoint.
    property trust_providers : Array(ClientVpnTrustProvider) | Nil

    def initialize(
      @trust_providers : Array(ClientVpnTrustProvider) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@trust_providers || [] of ClientVpnTrustProvider).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TrustProviderSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        trust_providers: node.xpath_nodes("*[local-name()='trustProviderSet']/*[local-name()='item']").map { |n| ClientVpnTrustProvider.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @trust_providers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@trust_providers)
  end
end
