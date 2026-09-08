private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a static route for a VPN connection.
  class VpnStaticRoute
    # The CIDR block associated with the local subnet of the customer data center.
    property destination_cidr_block : String | Nil

    # Indicates how the routes were provided.
    property source : VpnStaticRouteSource | Nil

    # The current state of the static route.
    property state : VpnState | Nil

    def initialize(
      @destination_cidr_block : String | Nil = nil,
      @source : VpnStaticRouteSource | Nil = nil,
      @state : VpnState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @source
        params << {"#{prefix}Source", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        source: (n = node.xpath_node("*[local-name()='source']")) ? AEC::VpnStaticRouteSource.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpnState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr_block, @source, @state)
  end
end
