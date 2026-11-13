private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyMetricCategoryRequest
    # The ID of the metric category.
    property metric_category_id : String

    # The names of the metrics for the metric category. These metrics replace the existing metrics,
    # and must differ from the current set.
    #
    # Specify each metric by its Amazon CloudWatch metric name or its OpenTelemetry metric name. The
    # two names for a measurement are separate entries, and you can include both.
    #
    # In Regions where Amazon CloudWatch OpenTelemetry metrics aren't available, you can't specify
    # OpenTelemetry metric names.
    property metrics : Array(String) = [] of String

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @metric_category_id : String,
      @metrics : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}MetricCategoryId", @metric_category_id}

      @metrics.each_with_index(1) do |item, i|
        params << {"#{prefix}Metric.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_category_id: Core::XMLValue.string(node.xpath_node("*[local-name()='MetricCategoryId']")).not_nil!,
        metrics: node.xpath_nodes("*[local-name()='Metric']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@metric_category_id, @metrics, @dry_run)
  end
end
