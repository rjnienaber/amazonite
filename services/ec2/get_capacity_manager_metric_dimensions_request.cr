private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerMetricDimensionsRequest
    # The dimensions to group by when retrieving available dimension values. This determines which
    # dimension combinations are returned. Required parameter.
    property group_by : Array(GroupBy) = [] of GroupBy

    # Conditions to filter which dimension values are returned. Each filter specifies a dimension,
    # comparison operator, and values to match against.
    property filter_by : Array(CapacityManagerCondition) | Nil

    # The start time for the dimension query, in ISO 8601 format. Only dimensions with data in this
    # time range will be returned.
    property start_time : Time

    # The end time for the dimension query, in ISO 8601 format. Only dimensions with data in this time
    # range will be returned.
    property end_time : Time

    # The metric names to use as an additional filter when retrieving dimensions. Only dimensions that
    # have data for these metrics will be returned. Required parameter with maximum size of 1 for v1.
    property metric_names : Array(Metric) = [] of Metric

    # The maximum number of dimension combinations to return. Valid range is 1 to 1000. Use with
    # NextToken for pagination.
    property max_results : Int32 | Nil

    # The token for the next page of results. Use this value in a subsequent call to retrieve
    # additional dimension values.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @group_by : Array(GroupBy),
      @start_time : Time,
      @end_time : Time,
      @metric_names : Array(Metric),
      @filter_by : Array(CapacityManagerCondition) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @group_by.each_with_index(1) do |item, i|
        params << {"#{prefix}GroupBy.#{i}", item.to_json_object_key}
      end

      (@filter_by || [] of CapacityManagerCondition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FilterBy.#{i}."))
      end

      params << {"#{prefix}StartTime", Core::QueryValue.time(@start_time)}

      params << {"#{prefix}EndTime", Core::QueryValue.time(@end_time)}

      @metric_names.each_with_index(1) do |item, i|
        params << {"#{prefix}MetricName.#{i}", item.to_json_object_key}
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
        group_by: node.xpath_nodes("*[local-name()='GroupBy']/*[local-name()='item']").compact_map { |n| AEC::GroupBy.from_json_object_key?(n.content) },
        filter_by: node.xpath_nodes("*[local-name()='FilterBy']/*[local-name()='item']").map { |n| CapacityManagerCondition.from_xml(n) },
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")).not_nil!,
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")).not_nil!,
        metric_names: node.xpath_nodes("*[local-name()='MetricName']/*[local-name()='item']").compact_map { |n| AEC::Metric.from_json_object_key?(n.content) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @group_by
        raise Core::ValidationError.new("GroupBy must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GroupBy must have at most 20 item(s)") if value.size > 20
      end

      if value = @filter_by
        raise Core::ValidationError.new("FilterBy must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("FilterBy must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end

      if value = @metric_names
        raise Core::ValidationError.new("MetricNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("MetricNames must have at most 40 item(s)") if value.size > 40
      end
    end

    def_equals_and_hash(@group_by, @filter_by, @start_time, @end_time, @metric_names, @max_results, @next_token, @dry_run)
  end
end
