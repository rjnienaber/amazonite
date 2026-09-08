private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumesModificationsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the volumes.
    property volume_ids : Array(String) | Nil

    # The filters.
    #
    # - `modification-state` - The current modification state (modifying | optimizing | completed |
    # failed).
    #
    # - `original-iops` - The original IOPS rate of the volume.
    #
    # - `original-size` - The original size of the volume, in GiB.
    #
    # - `original-volume-type` - The original volume type of the volume (standard | io1 | io2 | gp2 |
    # sc1 | st1).
    #
    # - `originalMultiAttachEnabled` - Indicates whether Multi-Attach support was enabled (true |
    # false).
    #
    # - `start-time` - The modification start time.
    #
    # - `target-iops` - The target IOPS rate of the volume.
    #
    # - `target-size` - The target size of the volume, in GiB.
    #
    # - `target-volume-type` - The target volume type of the volume (standard | io1 | io2 | gp2 | sc1
    # | st1).
    #
    # - `targetMultiAttachEnabled` - Indicates whether Multi-Attach support is to be enabled (true |
    # false).
    #
    # - `volume-id` - The ID of the volume.
    property filters : Array(Filter) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of results (up to a limit of 500) to be returned in a paginated request. For
    # more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # Indicates whether to include managed resources in the output. If this parameter is set to
    # `true`, the output includes resources that are managed by Amazon Web Services services, even if
    # managed resource visibility is set to hidden.
    property include_managed_resources : Bool | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @volume_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@volume_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VolumeId.#{i}", item}
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

      if value = @include_managed_resources
        params << {"#{prefix}IncludeManagedResources", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        volume_ids: node.xpath_nodes("*[local-name()='VolumeId']/*[local-name()='VolumeId']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @volume_ids, @filters, @next_token, @max_results, @include_managed_resources)
  end
end
