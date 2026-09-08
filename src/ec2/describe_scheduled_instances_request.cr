private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeScheduledInstances.
  class DescribeScheduledInstancesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `availability-zone` - The Availability Zone (for example, `us-west-2a`).
    #
    # - `instance-type` - The instance type (for example, `c4.large`).
    #
    # - `platform` - The platform (`Linux/UNIX` or `Windows`).
    property filters : Array(Filter) | Nil

    # The maximum number of results to return in a single call. This value can be between 5 and 300.
    # The default value is 100. To retrieve the remaining results, make another call with the returned
    # `NextToken` value.
    property max_results : Int32 | Nil

    # The token for the next set of results.
    property next_token : String | Nil

    # The Scheduled Instance IDs.
    property scheduled_instance_ids : Array(String) | Nil

    # The time period for the first schedule to start.
    property slot_start_time_range : SlotStartTimeRangeRequest | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @scheduled_instance_ids : Array(String) | Nil = nil,
      @slot_start_time_range : SlotStartTimeRangeRequest | Nil = nil,
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

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@scheduled_instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ScheduledInstanceId.#{i}", item}
      end

      if value = @slot_start_time_range
        params.concat(value.to_query_params("#{prefix}SlotStartTimeRange."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        scheduled_instance_ids: node.xpath_nodes("*[local-name()='ScheduledInstanceId']/*[local-name()='ScheduledInstanceId']").map { |n| n.content },
        slot_start_time_range: node.xpath_node("*[local-name()='SlotStartTimeRange']").try { |n| SlotStartTimeRangeRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @slot_start_time_range
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @filters, @max_results, @next_token, @scheduled_instance_ids, @slot_start_time_range)
  end
end
