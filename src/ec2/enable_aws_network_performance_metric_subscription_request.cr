private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableAwsNetworkPerformanceMetricSubscriptionRequest
    # The source Region (like `us-east-1`) or Availability Zone ID (like `use1-az1`) that the metric
    # subscription is enabled for. If you use Availability Zone IDs, the Source and Destination
    # Availability Zones must be in the same Region.
    property source : String | Nil

    # The target Region (like `us-east-2`) or Availability Zone ID (like `use2-az2`) that the metric
    # subscription is enabled for. If you use Availability Zone IDs, the Source and Destination
    # Availability Zones must be in the same Region.
    property destination : String | Nil

    # The metric used for the enabled subscription.
    property metric : MetricType | Nil

    # The statistic used for the enabled subscription.
    property statistic : StatisticType | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
      @metric : MetricType | Nil = nil,
      @statistic : StatisticType | Nil = nil,
      @dry_run : Bool | Nil = nil,
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

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source: Core::XMLValue.string(node.xpath_node("*[local-name()='Source']")),
        destination: Core::XMLValue.string(node.xpath_node("*[local-name()='Destination']")),
        metric: (n = node.xpath_node("*[local-name()='Metric']")) ? AEC::MetricType.from_json_object_key?(n.content) : nil,
        statistic: (n = node.xpath_node("*[local-name()='Statistic']")) ? AEC::StatisticType.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source, @destination, @metric, @statistic, @dry_run)
  end
end
