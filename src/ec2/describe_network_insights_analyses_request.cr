private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkInsightsAnalysesRequest
    # The ID of the network insights analyses. You must specify either analysis IDs or a path ID.
    property network_insights_analysis_ids : Array(String) | Nil

    # The ID of the path. You must specify either a path ID or analysis IDs.
    property network_insights_path_id : String | Nil

    # The time when the network insights analyses started.
    property analysis_start_time : Time | Nil

    # The time when the network insights analyses ended.
    property analysis_end_time : Time | Nil

    # The filters. The following are the possible values:
    #
    # - path-found - A Boolean value that indicates whether a feasible path is found.
    #
    # - status - The status of the analysis (running | succeeded | failed).
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @network_insights_analysis_ids : Array(String) | Nil = nil,
      @network_insights_path_id : String | Nil = nil,
      @analysis_start_time : Time | Nil = nil,
      @analysis_end_time : Time | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_insights_analysis_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInsightsAnalysisId.#{i}", item}
      end

      if value = @network_insights_path_id
        params << {"#{prefix}NetworkInsightsPathId", value}
      end

      if value = @analysis_start_time
        params << {"#{prefix}AnalysisStartTime", Core::QueryValue.time(value)}
      end

      if value = @analysis_end_time
        params << {"#{prefix}AnalysisEndTime", Core::QueryValue.time(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_analysis_ids: node.xpath_nodes("*[local-name()='NetworkInsightsAnalysisId']/*[local-name()='item']").map { |n| n.content },
        network_insights_path_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInsightsPathId']")),
        analysis_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='AnalysisStartTime']")),
        analysis_end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='AnalysisEndTime']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@network_insights_analysis_ids, @network_insights_path_id, @analysis_start_time, @analysis_end_time, @filters, @max_results, @dry_run, @next_token)
  end
end
