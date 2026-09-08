private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A query used for retrieving network health data.
  class DataQuery
    # A user-defined ID associated with a data query that's returned in the `dataResponse` identifying
    # the query. For example, if you set the Id to `MyQuery01`in the query, the `dataResponse`
    # identifies the query as `MyQuery01`.
    property id : String | Nil

    # The Region or Availability Zone that's the source for the data query. For example, `us-east-1`.
    property source : String | Nil

    # The Region or Availability Zone that's the target for the data query. For example, `eu-north-1`.
    property destination : String | Nil

    # The metric used for the network performance request.
    property metric : MetricType | Nil

    # The metric data aggregation period, `p50`, between the specified `startDate` and `endDate`. For
    # example, a metric of `five_minutes` is the median of all the data points gathered within those
    # five minutes. `p50` is the only supported metric.
    property statistic : StatisticType | Nil

    # The aggregation period used for the data query.
    property period : PeriodType | Nil

    def initialize(
      @id : String | Nil = nil,
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
      @metric : MetricType | Nil = nil,
      @statistic : StatisticType | Nil = nil,
      @period : PeriodType | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")),
        source: Core::XMLValue.string(node.xpath_node("*[local-name()='Source']")),
        destination: Core::XMLValue.string(node.xpath_node("*[local-name()='Destination']")),
        metric: (n = node.xpath_node("*[local-name()='Metric']")) ? AEC::MetricType.from_json_object_key?(n.content) : nil,
        statistic: (n = node.xpath_node("*[local-name()='Statistic']")) ? AEC::StatisticType.from_json_object_key?(n.content) : nil,
        period: (n = node.xpath_node("*[local-name()='Period']")) ? AEC::PeriodType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @source, @destination, @metric, @statistic, @period)
  end
end
