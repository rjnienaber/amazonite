private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerMetricDataRequest
    # The names of the metrics to retrieve. Maximum of 10 metrics per request.
    property metric_names : Array(Metric) = [] of Metric

    # The start time for the metric data query, in ISO 8601 format. The time range (end time - start
    # time) must be a multiple of the specified period.
    property start_time : Time

    # The end time for the metric data query, in ISO 8601 format. If the end time is beyond the latest
    # ingested data, it will be automatically adjusted to the latest available data point.
    property end_time : Time

    # The granularity, in seconds, of the returned data points.
    property period : Int32

    # The dimensions by which to group the metric data. This determines how the data is aggregated and
    # returned.
    property group_by : Array(GroupBy) | Nil

    # Conditions to filter the metric data. Each filter specifies a dimension, comparison operator
    # ('equals', 'in'), and values to match against.
    property filter_by : Array(CapacityManagerCondition) | Nil

    # The maximum number of data points to return. Valid range is 1 to 100,000. Use with NextToken for
    # pagination of large result sets.
    property max_results : Int32 | Nil

    # The token for the next page of results. Use this value in a subsequent call to retrieve
    # additional data points.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @metric_names : Array(Metric),
      @start_time : Time,
      @end_time : Time,
      @period : Int32,
      @group_by : Array(GroupBy) | Nil = nil,
      @filter_by : Array(CapacityManagerCondition) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @metric_names.each_with_index(1) do |item, i|
        params << {"#{prefix}MetricName.#{i}", item.to_json_object_key}
      end

      params << {"#{prefix}StartTime", Core::QueryValue.time(@start_time)}

      params << {"#{prefix}EndTime", Core::QueryValue.time(@end_time)}

      params << {"#{prefix}Period", @period.to_s}

      (@group_by || [] of GroupBy).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupBy.#{i}", item.to_json_object_key}
      end

      (@filter_by || [] of CapacityManagerCondition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FilterBy.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_names: node.xpath_nodes("*[local-name()='MetricName']/*[local-name()='item']").compact_map { |n| AEC::Metric.from_json_object_key?(n.content) },
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")).not_nil!,
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")).not_nil!,
        period: Core::XMLValue.i32(node.xpath_node("*[local-name()='Period']")).not_nil!,
        group_by: node.xpath_nodes("*[local-name()='GroupBy']/*[local-name()='item']").compact_map { |n| AEC::GroupBy.from_json_object_key?(n.content) },
        filter_by: node.xpath_nodes("*[local-name()='FilterBy']/*[local-name()='item']").map { |n| CapacityManagerCondition.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @metric_names
        raise Core::ValidationError.new("MetricNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("MetricNames must have at most 40 item(s)") if value.size > 40
      end

      if value = @period
        raise Core::ValidationError.new("Period value must be >= 3600") if value < 3600
      end

      if value = @group_by
        raise Core::ValidationError.new("GroupBy must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GroupBy must have at most 20 item(s)") if value.size > 20
      end

      if value = @filter_by
        raise Core::ValidationError.new("FilterBy must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("FilterBy must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_names, @start_time, @end_time, @period, @group_by, @filter_by, @max_results, @next_token, @dry_run)
  end
end
