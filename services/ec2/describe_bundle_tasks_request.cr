private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeBundleTasksRequest
    # The bundle task IDs.
    #
    # Default: Describes all your bundle tasks.
    property bundle_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `bundle-id` - The ID of the bundle task.
    #
    # - `error-code` - If the task failed, the error code returned.
    #
    # - `error-message` - If the task failed, the error message returned.
    #
    # - `instance-id` - The ID of the instance.
    #
    # - `progress` - The level of task completion, as a percentage (for example, 20%).
    #
    # - `s3-bucket` - The Amazon S3 bucket to store the AMI.
    #
    # - `s3-prefix` - The beginning of the AMI name.
    #
    # - `start-time` - The time the task started (for example, 2013-09-15T17:15:20.000Z).
    #
    # - `state` - The state of the task (`pending` | `waiting-for-shutdown` | `bundling` | `storing` |
    # `cancelling` | `complete` | `failed`).
    #
    # - `update-time` - The time of the most recent update for the task.
    property filters : Array(Filter) | Nil

    def initialize(
      @bundle_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@bundle_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}BundleId.#{i}", item}
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
        bundle_ids: node.xpath_nodes("*[local-name()='BundleId']/*[local-name()='BundleId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@bundle_ids, @dry_run, @filters)
  end
end
