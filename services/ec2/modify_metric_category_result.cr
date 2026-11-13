private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyMetricCategoryResult
    # Information about the metric category.
    property metric_category : MetricCategory | Nil

    def initialize(
      @metric_category : MetricCategory | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @metric_category
        params.concat(value.to_query_params("#{prefix}MetricCategory."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_category: node.xpath_node("*[local-name()='metricCategory']").try { |n| MetricCategory.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @metric_category
        value.validate!
      end
    end

    def_equals_and_hash(@metric_category)
  end
end
