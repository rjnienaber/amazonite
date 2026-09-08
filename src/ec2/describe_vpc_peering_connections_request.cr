private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcPeeringConnectionsRequest
    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the VPC peering connections.
    #
    # Default: Describes all your VPC peering connections.
    property vpc_peering_connection_ids : Array(String) | Nil

    # The filters.
    #
    # - `accepter-vpc-info.cidr-block` - The IPv4 CIDR block of the accepter VPC.
    #
    # - `accepter-vpc-info.owner-id` - The ID of the Amazon Web Services account that owns the
    # accepter VPC.
    #
    # - `accepter-vpc-info.vpc-id` - The ID of the accepter VPC.
    #
    # - `expiration-time` - The expiration date and time for the VPC peering connection.
    #
    # - `requester-vpc-info.cidr-block` - The IPv4 CIDR block of the requester's VPC.
    #
    # - `requester-vpc-info.owner-id` - The ID of the Amazon Web Services account that owns the
    # requester VPC.
    #
    # - `requester-vpc-info.vpc-id` - The ID of the requester VPC.
    #
    # - `status-code` - The status of the VPC peering connection (`pending-acceptance` | `failed` |
    # `expired` | `provisioning` | `active` | `deleting` | `deleted` | `rejected`).
    #
    # - `status-message` - A message that provides more information about the status of the VPC
    # peering connection, if applicable.
    #
    # - `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-peering-connection-id` - The ID of the VPC peering connection.
    property filters : Array(Filter) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @vpc_peering_connection_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@vpc_peering_connection_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpcPeeringConnectionId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        vpc_peering_connection_ids: node.xpath_nodes("*[local-name()='VpcPeeringConnectionId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @max_results, @dry_run, @vpc_peering_connection_ids, @filters)
  end
end
