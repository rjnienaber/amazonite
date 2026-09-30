private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumeStatusRequest
    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The IDs of the volumes.
    #
    # Default: Describes all your volumes.
    property volume_ids : Array(String) | Nil

    # Indicates whether to include managed resources in the output. If this parameter is set to
    # `true`, the output includes resources that are managed by Amazon Web Services services, even if
    # managed resource visibility is set to hidden.
    property include_managed_resources : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `action.code` - The action code for the event (for example, `enable-volume-io`).
    #
    # - `action.description` - A description of the action.
    #
    # - `action.event-id` - The event ID associated with the action.
    #
    # - `availability-zone` - The Availability Zone of the instance.
    #
    # - `event.description` - A description of the event.
    #
    # - `event.event-id` - The event ID.
    #
    # - `event.event-type` - The event type (for `io-enabled`: `passed` | `failed`; for
    # `io-performance`: `io-performance:degraded` | `io-performance:severely-degraded` |
    # `io-performance:stalled`).
    #
    # - `event.not-after` - The latest end time for the event.
    #
    # - `event.not-before` - The earliest start time for the event.
    #
    # - `volume-status.details-name` - The cause for `volume-status.status` (`io-enabled` |
    # `io-performance`).
    #
    # - `volume-status.details-status` - The status of `volume-status.details-name` (for `io-enabled`:
    # `passed` | `failed`; for `io-performance`: `normal` | `degraded` | `severely-degraded` |
    # `stalled`).
    #
    # - `volume-status.status` - The status of the volume (`ok` | `impaired` | `warning` |
    # `insufficient-data`).
    property filters : Array(Filter) | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @volume_ids : Array(String) | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@volume_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VolumeId.#{i}", item}
      end

      if value = @include_managed_resources
        params << {"#{prefix}IncludeManagedResources", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        volume_ids: node.xpath_nodes("*[local-name()='VolumeId']/*[local-name()='VolumeId']").map { |n| n.content },
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@max_results, @next_token, @volume_ids, @include_managed_resources, @dry_run, @filters)
  end
end
