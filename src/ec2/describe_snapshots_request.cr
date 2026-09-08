private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSnapshotsRequest
    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Scopes the results to snapshots with the specified owners. You can specify a combination of
    # Amazon Web Services account IDs, `self`, and `amazon`.
    property owner_ids : Array(String) | Nil

    # The IDs of the Amazon Web Services accounts that can create volumes from the snapshot.
    property restorable_by_user_ids : Array(String) | Nil

    # The snapshot IDs.
    #
    # Default: Describes the snapshots for which you have create volume permissions.
    property snapshot_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `description` - A description of the snapshot.
    #
    # - `encrypted` - Indicates whether the snapshot is encrypted (`true` | `false`)
    #
    # - `owner-alias` - The owner alias, from an Amazon-maintained list (`amazon`). This is not the
    # user-configured Amazon Web Services account alias set using the IAM console. We recommend that
    # you use the related parameter instead of this filter.
    #
    # - `owner-id` - The Amazon Web Services account ID of the owner. We recommend that you use the
    # related parameter instead of this filter.
    #
    # - `progress` - The progress of the snapshot, as a percentage (for example, 80%).
    #
    # - `snapshot-id` - The snapshot ID.
    #
    # - `start-time` - The time stamp when the snapshot was initiated.
    #
    # - `status` - The status of the snapshot (`pending` | `completed` | `error`).
    #
    # - `storage-tier` - The storage tier of the snapshot (`archive` | `standard`).
    #
    # - `transfer-type` - The type of operation used to create the snapshot (`time-based` |
    # `standard`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `volume-id` - The ID of the volume the snapshot is for.
    #
    # - `volume-size` - The size of the volume, in GiB.
    property filters : Array(Filter) | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @owner_ids : Array(String) | Nil = nil,
      @restorable_by_user_ids : Array(String) | Nil = nil,
      @snapshot_ids : Array(String) | Nil = nil,
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

      (@owner_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Owner.#{i}", item}
      end

      (@restorable_by_user_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RestorableBy.#{i}", item}
      end

      (@snapshot_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SnapshotId.#{i}", item}
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
        owner_ids: node.xpath_nodes("*[local-name()='Owner']/*[local-name()='Owner']").map { |n| n.content },
        restorable_by_user_ids: node.xpath_nodes("*[local-name()='RestorableBy']/*[local-name()='item']").map { |n| n.content },
        snapshot_ids: node.xpath_nodes("*[local-name()='SnapshotId']/*[local-name()='SnapshotId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@max_results, @next_token, @owner_ids, @restorable_by_user_ids, @snapshot_ids, @dry_run, @filters)
  end
end
