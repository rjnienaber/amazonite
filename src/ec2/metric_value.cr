private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Represents a single metric value with its associated statistic, such as the sum or average of
  # unused capacity hours.
  class MetricValue
    # The name of the metric.
    property metric : Metric | Nil

    # The numerical value of the metric for the specified statistic and time period.
    property value : Float64 | Nil

    def initialize(
      @metric : Metric | Nil = nil,
      @value : Float64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @metric
        params << {"#{prefix}Metric", value.to_json_object_key}
      end

      if value = @value
        params << {"#{prefix}Value", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric: (n = node.xpath_node("*[local-name()='metric']")) ? AEC::Metric.from_json_object_key?(n.content) : nil,
        value: Core::XMLValue.f64(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@metric, @value)
  end
end
