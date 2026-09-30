private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMacModificationTasksRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specifies one or more filters for the request:
    #
    # - `instance-id` - The ID of the instance for which the task was created.
    #
    # - `task-state` - The state of the task (`successful` | `failed` | `in-progress` | `pending`).
    #
    # - `mac-system-integrity-protection-configuration.sip-status` - The overall SIP state requested
    # in the task (`enabled` | `disabled`).
    #
    # - `start-time` - The date and time the task was created.
    #
    # - `task-type` - The type of task (`sip-modification` | `volume-ownership-delegation`).
    property filters : Array(Filter) | Nil

    # The ID of task.
    property mac_modification_task_ids : Array(String) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the returned `nextToken` value. This value can be
    # between 5 and 500. If `maxResults` is given a larger value than 500, you receive an error.
    property max_results : Int32 | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @mac_modification_task_ids : Array(String) | Nil = nil,
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
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@mac_modification_task_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MacModificationTaskId.#{i}", item}
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
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        mac_modification_task_ids: node.xpath_nodes("*[local-name()='MacModificationTaskId']/*[local-name()='item']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 500") if value > 500
      end
    end

    def_equals_and_hash(@dry_run, @filters, @mac_modification_task_ids, @max_results, @next_token)
  end
end
