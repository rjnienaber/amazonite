private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes dynamic routing for the transit gateway peering attachment.
  class TransitGatewayPeeringAttachmentOptions
    # Describes whether dynamic routing is enabled or disabled for the transit gateway peering
    # attachment.
    property dynamic_routing : DynamicRoutingValue | Nil

    def initialize(
      @dynamic_routing : DynamicRoutingValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dynamic_routing
        params << {"#{prefix}DynamicRouting", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dynamic_routing: (n = node.xpath_node("*[local-name()='dynamicRouting']")) ? AEC::DynamicRoutingValue.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dynamic_routing)
  end
end
