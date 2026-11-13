private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteMetricCategoryResult
    # The ID of the metric category that was deleted.
    property metric_category_id : String | Nil

    def initialize(
      @metric_category_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @metric_category_id
        params << {"#{prefix}MetricCategoryId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_category_id: Core::XMLValue.string(node.xpath_node("*[local-name()='metricCategoryId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@metric_category_id)
  end
end
