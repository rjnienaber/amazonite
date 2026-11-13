private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a metric category. A metric category is a set of additional metrics that you can
  # associate with an instance that has detailed monitoring enabled.
  class MetricCategory
    # The ID of the metric category.
    property metric_category_id : String | Nil

    # The names of the metrics in the metric category.
    property metrics : Array(String) | Nil

    # Any tags assigned to the metric category.
    property tags : Array(Tag) | Nil

    def initialize(
      @metric_category_id : String | Nil = nil,
      @metrics : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @metric_category_id
        params << {"#{prefix}MetricCategoryId", value}
      end

      (@metrics || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MetricSet.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_category_id: Core::XMLValue.string(node.xpath_node("*[local-name()='metricCategoryId']")),
        metrics: node.xpath_nodes("*[local-name()='metricSet']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_category_id, @metrics, @tags)
  end
end
