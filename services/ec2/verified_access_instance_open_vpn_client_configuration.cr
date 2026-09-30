private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a set of routes.
  class VerifiedAccessInstanceOpenVpnClientConfiguration
    # The base64-encoded Open VPN client configuration.
    property config : String | Nil

    # The routes.
    property routes : Array(VerifiedAccessInstanceOpenVpnClientConfigurationRoute) | Nil

    def initialize(
      @config : String | Nil = nil,
      @routes : Array(VerifiedAccessInstanceOpenVpnClientConfigurationRoute) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @config
        params << {"#{prefix}Config", value}
      end

      (@routes || [] of VerifiedAccessInstanceOpenVpnClientConfigurationRoute).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        config: Core::XMLValue.string(node.xpath_node("*[local-name()='config']")),
        routes: node.xpath_nodes("*[local-name()='routeSet']/*[local-name()='item']").map { |n| VerifiedAccessInstanceOpenVpnClientConfigurationRoute.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @routes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@config, @routes)
  end
end
