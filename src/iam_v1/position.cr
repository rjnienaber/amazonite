private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Position
    property line : Int32 | Nil

    property column : Int32 | Nil

    def initialize(
      @line : Int32 | Nil = nil,
      @column : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @line
        params << {"#{prefix}Line", value.to_s}
      end

      if value = @column
        params << {"#{prefix}Column", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        line: Core::XMLValue.i32(node.xpath_node("*[local-name()='Line']")),
        column: Core::XMLValue.i32(node.xpath_node("*[local-name()='Column']")),
      )
    end
  end
end
