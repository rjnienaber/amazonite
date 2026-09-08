private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The response to a `DataQuery`.
  class DataResponse
    # The ID passed in the `DataQuery`.
    property id : String | Nil

    # The Region or Availability Zone that's the source for the data query. For example, `us-east-1`.
    property source : String | Nil

    # The Region or Availability Zone that's the destination for the data query. For example,
    # `eu-west-1`.
    property destination : String | Nil

    # The metric used for the network performance request.
    property metric : MetricType | Nil

    # The statistic used for the network performance request.
    property statistic : StatisticType | Nil

    # The period used for the network performance request.
    property period : PeriodType | Nil

    # A list of `MetricPoint` objects.
    property metric_points : Array(MetricPoint) | Nil

    def initialize(
      @id : String | Nil = nil,
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
      @metric : MetricType | Nil = nil,
      @statistic : StatisticType | Nil = nil,
      @period : PeriodType | Nil = nil,
      @metric_points : Array(MetricPoint) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @source
        params << {"#{prefix}Source", value}
      end

      if value = @destination
        params << {"#{prefix}Destination", value}
      end

      if value = @metric
        params << {"#{prefix}Metric", value.to_json_object_key}
      end

      if value = @statistic
        params << {"#{prefix}Statistic", value.to_json_object_key}
      end

      if value = @period
        params << {"#{prefix}Period", value.to_json_object_key}
      end

      (@metric_points || [] of MetricPoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MetricPointSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='id']")),
        source: Core::XMLValue.string(node.xpath_node("*[local-name()='source']")),
        destination: Core::XMLValue.string(node.xpath_node("*[local-name()='destination']")),
        metric: (n = node.xpath_node("*[local-name()='metric']")) ? AEC::MetricType.from_json_object_key?(n.content) : nil,
        statistic: (n = node.xpath_node("*[local-name()='statistic']")) ? AEC::StatisticType.from_json_object_key?(n.content) : nil,
        period: (n = node.xpath_node("*[local-name()='period']")) ? AEC::PeriodType.from_json_object_key?(n.content) : nil,
        metric_points: node.xpath_nodes("*[local-name()='metricPointSet']/*[local-name()='item']").map { |n| MetricPoint.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @metric_points
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@id, @source, @destination, @metric, @statistic, @period, @metric_points)
  end
end
