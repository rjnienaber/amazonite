private alias Core = Amazonite::Core

module Amazonite::EC2
  # Represents a filter condition for Capacity Manager queries. Contains dimension-based filtering
  # criteria used to narrow down metric data and dimension results.
  class CapacityManagerCondition
    # The dimension-based condition that specifies how to filter the data based on dimension values.
    property dimension_condition : DimensionCondition | Nil

    def initialize(
      @dimension_condition : DimensionCondition | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dimension_condition
        params.concat(value.to_query_params("#{prefix}DimensionCondition."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dimension_condition: node.xpath_node("*[local-name()='DimensionCondition']").try { |n| DimensionCondition.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dimension_condition
        value.validate!
      end
    end

    def_equals_and_hash(@dimension_condition)
  end
end
