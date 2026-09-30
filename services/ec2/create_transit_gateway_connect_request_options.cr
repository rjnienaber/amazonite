private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The options for a Connect attachment.
  class CreateTransitGatewayConnectRequestOptions
    # The tunnel protocol.
    property protocol : ProtocolValue

    def initialize(
      @protocol : ProtocolValue,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Protocol", @protocol.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        protocol: ((n = node.xpath_node("*[local-name()='Protocol']")) ? AEC::ProtocolValue.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@protocol)
  end
end
