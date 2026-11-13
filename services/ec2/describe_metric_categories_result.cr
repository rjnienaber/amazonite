private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMetricCategoriesResult
    # Information about the metric categories.
    property metric_categories : Array(MetricCategory) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @metric_categories : Array(MetricCategory) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@metric_categories || [] of MetricCategory).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MetricCategorySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_categories: node.xpath_nodes("*[local-name()='metricCategorySet']/*[local-name()='item']").map { |n| MetricCategory.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @metric_categories
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_categories, @next_token)
  end
end
