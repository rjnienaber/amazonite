private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains a single data point from a capacity metrics query, including the dimension values,
  # timestamp, and metric values for that specific combination.
  class MetricDataResult
    # The dimension values that identify this specific data point, such as account ID, region, and
    # instance family.
    property dimension : CapacityManagerDimension | Nil

    # The timestamp for this data point, indicating when the capacity usage occurred.
    property timestamp : Time | Nil

    # The metric values and statistics for this data point, containing the actual capacity usage
    # numbers.
    property metric_values : Array(MetricValue) | Nil

    def initialize(
      @dimension : CapacityManagerDimension | Nil = nil,
      @timestamp : Time | Nil = nil,
      @metric_values : Array(MetricValue) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dimension
        params.concat(value.to_query_params("#{prefix}Dimension."))
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end

      (@metric_values || [] of MetricValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MetricValueSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dimension: node.xpath_node("*[local-name()='dimension']").try { |n| CapacityManagerDimension.from_xml(n) },
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='timestamp']")),
        metric_values: node.xpath_nodes("*[local-name()='metricValueSet']/*[local-name()='item']").map { |n| MetricValue.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dimension
        value.validate!
      end

      if value = @metric_values
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dimension, @timestamp, @metric_values)
  end
end
