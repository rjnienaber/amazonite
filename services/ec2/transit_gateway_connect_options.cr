private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the Connect attachment options.
  class TransitGatewayConnectOptions
    # The tunnel protocol.
    property protocol : ProtocolValue | Nil

    def initialize(
      @protocol : ProtocolValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        protocol: (n = node.xpath_node("*[local-name()='protocol']")) ? AEC::ProtocolValue.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@protocol)
  end
end
