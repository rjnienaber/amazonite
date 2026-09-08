private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTrafficMirrorSessionsRequest
    # The ID of the Traffic Mirror session.
    property traffic_mirror_session_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters. The possible values are:
    #
    # - `description`: The Traffic Mirror session description.
    #
    # - `network-interface-id`: The ID of the Traffic Mirror session network interface.
    #
    # - `owner-id`: The ID of the account that owns the Traffic Mirror session.
    #
    # - `packet-length`: The assigned number of packets to mirror.
    #
    # - `session-number`: The assigned session number.
    #
    # - `traffic-mirror-filter-id`: The ID of the Traffic Mirror filter.
    #
    # - `traffic-mirror-session-id`: The ID of the Traffic Mirror session.
    #
    # - `traffic-mirror-target-id`: The ID of the Traffic Mirror target.
    #
    # - `virtual-network-id`: The virtual network ID of the Traffic Mirror session.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @traffic_mirror_session_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@traffic_mirror_session_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TrafficMirrorSessionId.#{i}", item}
      end

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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_session_ids: node.xpath_nodes("*[local-name()='TrafficMirrorSessionId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
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
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@traffic_mirror_session_ids, @dry_run, @filters, @max_results, @next_token)
  end
end
