private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumesRequest
    # The volume IDs. If not specified, then all volumes are included in the response.
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
    # - `attachment.attach-time` - The time stamp when the attachment initiated.
    #
    # - `attachment.delete-on-termination` - Whether the volume is deleted on instance termination.
    #
    # - `attachment.device` - The device name specified in the block device mapping (for example,
    # `/dev/sda1`).
    #
    # - `attachment.instance-id` - The ID of the instance the volume is attached to.
    #
    # - `attachment.status` - The attachment state (`attaching` | `attached` | `detaching`).
    #
    # - `availability-zone` - The Availability Zone in which the volume was created.
    #
    # - `availability-zone-id` - The ID of the Availability Zone in which the volume was created.
    #
    # - `create-time` - The time stamp when the volume was created.
    #
    # - `encrypted` - Indicates whether the volume is encrypted (`true` | `false`)
    #
    # - `fast-restored` - Indicates whether the volume was created from a snapshot that is enabled for
    # fast snapshot restore (`true` | `false`).
    #
    # - `multi-attach-enabled` - Indicates whether the volume is enabled for Multi-Attach (`true` |
    # `false`)
    #
    # - `operator.managed` - A Boolean that indicates whether this is a managed volume.
    #
    # - `operator.principal` - The principal that manages the volume. Only valid for managed volumes,
    # where `managed` is `true`.
    #
    # - `size` - The size of the volume, in GiB.
    #
    # - `snapshot-id` - The snapshot from which the volume was created.
    #
    # - `status` - The state of the volume (`creating` | `available` | `in-use` | `deleting` |
    # `deleted` | `error`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `volume-id` - The volume ID.
    #
    # - `volume-type` - The Amazon EBS volume type (`gp2` | `gp3` | `io1` | `io2` | `st1` | `sc1`|
    # `standard`)
    property filters : Array(Filter) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @volume_ids : Array(String) | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volume_ids: node.xpath_nodes("*[local-name()='VolumeId']/*[local-name()='VolumeId']").map { |n| n.content },
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@volume_ids, @include_managed_resources, @dry_run, @filters, @next_token, @max_results)
  end
end
