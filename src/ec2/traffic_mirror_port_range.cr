private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Traffic Mirror port range.
  class TrafficMirrorPortRange
    # The start of the Traffic Mirror port range. This applies to the TCP and UDP protocols.
    property from_port : Int32 | Nil

    # The end of the Traffic Mirror port range. This applies to the TCP and UDP protocols.
    property to_port : Int32 | Nil

    def initialize(
      @from_port : Int32 | Nil = nil,
      @to_port : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @from_port
        params << {"#{prefix}FromPort", value.to_s}
      end

      if value = @to_port
        params << {"#{prefix}ToPort", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='fromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='toPort']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@from_port, @to_port)
  end
end
