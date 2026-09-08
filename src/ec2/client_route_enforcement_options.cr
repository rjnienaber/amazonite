private alias Core = Amazonite::Core

module Amazonite::EC2
  # Client Route Enforcement is a feature of Client VPN that helps enforce administrator defined
  # routes on devices connected through the VPN. This feature helps improve your security posture by
  # ensuring that network traffic originating from a connected client is not inadvertently sent
  # outside the VPN tunnel.
  #
  # Client Route Enforcement works by monitoring the route table of a connected device for routing
  # policy changes to the VPN connection. If the feature detects any VPN routing policy
  # modifications, it will automatically force an update to the route table, reverting it back to
  # the expected route configurations.
  class ClientRouteEnforcementOptions
    # Enable or disable Client Route Enforcement. The state can either be `true` (enabled) or `false`
    # (disabled). The default is `false`.
    #
    # Valid values: `true | false`
    #
    # Default value: `false`
    property enforced : Bool | Nil

    def initialize(
      @enforced : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enforced
        params << {"#{prefix}Enforced", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enforced: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enforced']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enforced)
  end
end
