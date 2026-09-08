private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a port range.
  class RequestFilterPortRange
    # The first port in the range.
    property from_port : Int32 | Nil

    # The last port in the range.
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
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='FromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='ToPort']")),
      )
    end

    def validate! : Nil
      if value = @from_port
        raise Core::ValidationError.new("FromPort value must be >= 0") if value < 0
        raise Core::ValidationError.new("FromPort value must be <= 65535") if value > 65535
      end

      if value = @to_port
        raise Core::ValidationError.new("ToPort value must be >= 0") if value < 0
        raise Core::ValidationError.new("ToPort value must be <= 65535") if value > 65535
      end
    end

    def_equals_and_hash(@from_port, @to_port)
  end
end
