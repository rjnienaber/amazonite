private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describe instance event windows by InstanceEventWindow.
  class DescribeInstanceEventWindowsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the event windows.
    property instance_event_window_ids : Array(String) | Nil

    # One or more filters.
    #
    # - `dedicated-host-id` - The event windows associated with the specified Dedicated Host ID.
    #
    # - `event-window-name` - The event windows associated with the specified names.
    #
    # - `instance-id` - The event windows associated with the specified instance ID.
    #
    # - `instance-tag` - The event windows associated with the specified tag and value.
    #
    # - `instance-tag-key` - The event windows associated with the specified tag key, regardless of
    # the value.
    #
    # - `instance-tag-value` - The event windows associated with the specified tag value, regardless
    # of the key.
    #
    # - `tag:` - The key/value combination of a tag assigned to the event window. Use the tag key in
    # the filter name and the tag value as the filter value. For example, to find all resources that
    # have a tag with the key `Owner` and the value `CMX`, specify `tag:Owner` for the filter name and
    # `CMX` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the event window. Use this filter to find all event
    # windows that have a tag with a specific key, regardless of the tag value.
    #
    # - `tag-value` - The value of a tag assigned to the event window. Use this filter to find all
    # event windows that have a tag with a specific value, regardless of the tag key.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another call with the returned `NextToken` value. This value can be between 20 and 500. You
    # cannot specify this parameter and the event window IDs parameter in the same call.
    property max_results : Int32 | Nil

    # The token to request the next page of results.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @instance_event_window_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@instance_event_window_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceEventWindowId.#{i}", item}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_event_window_ids: node.xpath_nodes("*[local-name()='InstanceEventWindowId']/*[local-name()='InstanceEventWindowId']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 20") if value < 20
        raise Core::ValidationError.new("MaxResults value must be <= 500") if value > 500
      end
    end

    def_equals_and_hash(@dry_run, @instance_event_window_ids, @filters, @max_results, @next_token)
  end
end
