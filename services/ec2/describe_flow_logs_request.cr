private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFlowLogsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters.
    #
    # - `deliver-log-status` - The status of the logs delivery (`SUCCESS` | `FAILED`).
    #
    # - `log-destination-type` - The type of destination for the flow log data (`cloud-watch-logs` |
    # `s3` | `kinesis-data-firehose`).
    #
    # - `flow-log-id` - The ID of the flow log.
    #
    # - `log-group-name` - The name of the log group.
    #
    # - `resource-id` - The ID of the VPC, subnet, or network interface.
    #
    # - `traffic-type` - The type of traffic (`ACCEPT` | `REJECT` | `ALL`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filter : Array(Filter) | Nil

    # One or more flow log IDs.
    #
    # Constraint: Maximum of 1000 flow log IDs.
    property flow_log_ids : Array(String) | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token to request the next page of items. Pagination continues from the end of the items
    # returned by the previous request.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filter : Array(Filter) | Nil = nil,
      @flow_log_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filter || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@flow_log_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FlowLogId.#{i}", item}
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
        filter: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        flow_log_ids: node.xpath_nodes("*[local-name()='FlowLogId']/*[local-name()='item']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filter
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @filter, @flow_log_ids, @max_results, @next_token)
  end
end
