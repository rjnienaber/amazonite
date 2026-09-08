private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Specifies a condition for filtering capacity data based on dimension values. Used to create
  # precise filters for metric queries and dimension lookups.
  class DimensionCondition
    # The name of the dimension to filter by.
    property dimension : FilterByDimension | Nil

    # The comparison operator to use for the filter.
    property comparison : Comparison | Nil

    # The list of values to match against the specified dimension. For 'equals' comparison, only the
    # first value is used. For 'in' comparison, any matching value will satisfy the condition.
    property values : Array(String) | Nil

    def initialize(
      @dimension : FilterByDimension | Nil = nil,
      @comparison : Comparison | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dimension
        params << {"#{prefix}Dimension", value.to_json_object_key}
      end

      if value = @comparison
        params << {"#{prefix}Comparison", value.to_json_object_key}
      end

      (@values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Value.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dimension: (n = node.xpath_node("*[local-name()='Dimension']")) ? AEC::FilterByDimension.from_json_object_key?(n.content) : nil,
        comparison: (n = node.xpath_node("*[local-name()='Comparison']")) ? AEC::Comparison.from_json_object_key?(n.content) : nil,
        values: node.xpath_nodes("*[local-name()='Value']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Values must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@dimension, @comparison, @values)
  end
end
