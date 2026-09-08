private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribePlacementGroupsRequest
    # The IDs of the placement groups.
    property group_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The names of the placement groups.
    #
    # Constraints:
    #
    # - You can specify a name only if the placement group is owned by your account.
    #
    # - If a placement group is *shared* with your account, specifying the name results in an error.
    # You must use the `GroupId` parameter instead.
    property group_names : Array(String) | Nil

    # The filters.
    #
    # - `group-name` - The name of the placement group.
    #
    # - `group-arn` - The Amazon Resource Name (ARN) of the placement group.
    #
    # - `spread-level` - The spread level for the placement group (`host` | `rack`).
    #
    # - `state` - The state of the placement group (`pending` | `available` | `deleting` | `deleted`).
    #
    # - `strategy` - The strategy of the placement group (`cluster` | `spread` | `partition` |
    # `precision-time`).
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # that have a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    def initialize(
      @group_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @group_names : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@group_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupName.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_ids: node.xpath_nodes("*[local-name()='GroupId']/*[local-name()='GroupId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        group_names: node.xpath_nodes("*[local-name()='groupName']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@group_ids, @dry_run, @group_names, @filters)
  end
end
