private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceImageMetadataRequest
    # The filters.
    #
    # - `availability-zone` - The name of the Availability Zone (for example, `us-west-2a`) or Local
    # Zone (for example, `us-west-2-lax-1b`) of the instance.
    #
    # - `instance-id` - The ID of the instance.
    #
    # - `image-allowed` - A Boolean that indicates whether the image meets the criteria specified for
    # Allowed AMIs.
    #
    # - `instance-state-name` - The state of the instance (`pending` | `running` | `shutting-down` |
    # `terminated` | `stopping` | `stopped`).
    #
    # - `instance-type` - The type of instance (for example, `t3.micro`).
    #
    # - `launch-time` - The time when the instance was launched, in the ISO 8601 format in the UTC
    # time zone (YYYY-MM-DDThh:mm:ss.sssZ), for example, `2023-09-29T11:04:43.305Z`. You can use a
    # wildcard (`*`), for example, `2023-09-29T*`, which matches an entire day.
    #
    # - `owner-alias` - The owner alias (`amazon` | `aws-marketplace` | `aws-backup-vault`). The valid
    # aliases are defined in an Amazon-maintained list. This is not the Amazon Web Services account
    # alias that can be set using the IAM console. We recommend that you use the `Owner` request
    # parameter instead of this filter.
    #
    # - `owner-id` - The Amazon Web Services account ID of the owner. We recommend that you use the
    # `Owner` request parameter instead of this filter.
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `zone-id` - The ID of the Availability Zone (for example, `usw2-az2`) or Local Zone (for
    # example, `usw2-lax1-az1`) of the instance.
    property filters : Array(Filter) | Nil

    # The instance IDs.
    #
    # If you don't specify an instance ID or filters, the output includes information for all
    # instances.
    property instance_ids : Array(String) | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    #
    # Default: 1000
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
      @instance_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='InstanceId']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@filters, @instance_ids, @max_results, @next_token, @dry_run)
  end
end
