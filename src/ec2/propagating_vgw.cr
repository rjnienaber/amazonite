private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a virtual private gateway propagating route.
  class PropagatingVgw
    # The ID of the virtual private gateway.
    property gateway_id : String | Nil

    def initialize(
      @gateway_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @gateway_id
        params << {"#{prefix}GatewayId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='gatewayId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@gateway_id)
  end
end
