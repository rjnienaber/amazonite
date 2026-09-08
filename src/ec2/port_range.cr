private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a range of ports.
  class PortRange
    # The first port in the range.
    property from : Int32 | Nil

    # The last port in the range.
    property to : Int32 | Nil

    def initialize(
      @from : Int32 | Nil = nil,
      @to : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @from
        params << {"#{prefix}From", value.to_s}
      end

      if value = @to
        params << {"#{prefix}To", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        from: Core::XMLValue.i32(node.xpath_node("*[local-name()='from']")),
        to: Core::XMLValue.i32(node.xpath_node("*[local-name()='to']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@from, @to)
  end
end
