private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the row and column of a location of a `Statement` element in a policy document.
  #
  # This data type is used as a member of the `
  # [Statement](https://docs.aws.amazon.com/IAM/latest/APIReference/API_Statement.html) ` type.
  class Position
    # The line containing the specified position in the document.
    property line : Int32 | Nil

    # The column in the line containing the specified position in the document.
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

    def validate! : Nil
    end

    def_equals_and_hash(@line, @column)
  end
end
