private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetAwsNetworkPerformanceDataRequest
    # A list of network performance data queries.
    property data_queries : Array(DataQuery) | Nil

    # The starting time for the performance data request. The starting time must be formatted as
    # `yyyy-mm-ddThh:mm:ss`. For example, `2022-06-10T12:00:00.000Z`.
    property start_time : Time | Nil

    # The ending time for the performance data request. The end time must be formatted as
    # `yyyy-mm-ddThh:mm:ss`. For example, `2022-06-12T12:00:00.000Z`.
    property end_time : Time | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @data_queries : Array(DataQuery) | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@data_queries || [] of DataQuery).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DataQuery.#{i}."))
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
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
        data_queries: node.xpath_nodes("*[local-name()='DataQuery']/*[local-name()='item']").map { |n| DataQuery.from_xml(n) },
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @data_queries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@data_queries, @start_time, @end_time, @max_results, @next_token, @dry_run)
  end
end
