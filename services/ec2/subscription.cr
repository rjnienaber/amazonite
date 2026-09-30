private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Infrastructure Performance subscription.
  class Subscription
    # The Region or Availability Zone that's the source for the subscription. For example,
    # `us-east-1`.
    property source : String | Nil

    # The Region or Availability Zone that's the target for the subscription. For example,
    # `eu-west-1`.
    property destination : String | Nil

    # The metric used for the subscription.
    property metric : MetricType | Nil

    # The statistic used for the subscription.
    property statistic : StatisticType | Nil

    # The data aggregation time for the subscription.
    property period : PeriodType | Nil

    def initialize(
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
      @metric : MetricType | Nil = nil,
      @statistic : StatisticType | Nil = nil,
      @period : PeriodType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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
        source: Core::XMLValue.string(node.xpath_node("*[local-name()='source']")),
        destination: Core::XMLValue.string(node.xpath_node("*[local-name()='destination']")),
        metric: (n = node.xpath_node("*[local-name()='metric']")) ? AEC::MetricType.from_json_object_key?(n.content) : nil,
        statistic: (n = node.xpath_node("*[local-name()='statistic']")) ? AEC::StatisticType.from_json_object_key?(n.content) : nil,
        period: (n = node.xpath_node("*[local-name()='period']")) ? AEC::PeriodType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source, @destination, @metric, @statistic, @period)
  end
end
