private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcsRequest
    # The filters.
    #
    # - `cidr` - The primary IPv4 CIDR block of the VPC. The CIDR block you specify must exactly match
    # the VPC's CIDR block for information to be returned for the VPC. Must contain the slash followed
    # by one or two digits (for example, `/28`).
    #
    # - `cidr-block-association.cidr-block` - An IPv4 CIDR block associated with the VPC.
    #
    # - `cidr-block-association.association-id` - The association ID for an IPv4 CIDR block associated
    # with the VPC.
    #
    # - `cidr-block-association.state` - The state of an IPv4 CIDR block associated with the VPC.
    #
    # - `dhcp-options-id` - The ID of a set of DHCP options.
    #
    # - `ipv6-cidr-block-association.ipv6-cidr-block` - An IPv6 CIDR block associated with the VPC.
    #
    # - `ipv6-cidr-block-association.ipv6-pool` - The ID of the IPv6 address pool from which the IPv6
    # CIDR block is allocated.
    #
    # - `ipv6-cidr-block-association.association-id` - The association ID for an IPv6 CIDR block
    # associated with the VPC.
    #
    # - `ipv6-cidr-block-association.state` - The state of an IPv6 CIDR block associated with the VPC.
    #
    # - `is-default` - Indicates whether the VPC is the default VPC.
    #
    # - `owner-id` - The ID of the Amazon Web Services account that owns the VPC.
    #
    # - `state` - The state of the VPC (`pending` | `available`).
    #
    # - `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-id` - The ID of the VPC.
    property filters : Array(Filter) | Nil

    # The IDs of the VPCs.
    property vpc_ids : Array(String) | Nil

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

    def initialize(
      @filters : Array(Filter) | Nil = nil,
      @vpc_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@vpc_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpcId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        vpc_ids: node.xpath_nodes("*[local-name()='VpcId']/*[local-name()='VpcId']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
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

    def_equals_and_hash(@filters, @vpc_ids, @next_token, @max_results, @dry_run)
  end
end
