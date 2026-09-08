private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImportSnapshotTasksRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    property filters : Array(Filter) | Nil

    # A list of import snapshot task IDs.
    property import_task_ids : Array(String) | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another call with the returned `NextToken` value.
    property max_results : Int32 | Nil

    # A token that indicates the next page of results.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @import_task_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filters.#{i}."))
      end

      (@import_task_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImportTaskId.#{i}", item}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filters']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        import_task_ids: node.xpath_nodes("*[local-name()='ImportTaskId']/*[local-name()='ImportTaskId']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @filters, @import_task_ids, @max_results, @next_token)
  end
end
