private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkAclsRequest
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

    # The IDs of the network ACLs.
    property network_acl_ids : Array(String) | Nil

    # The filters.
    #
    # - `association.association-id` - The ID of an association ID for the ACL.
    #
    # - `association.network-acl-id` - The ID of the network ACL involved in the association.
    #
    # - `association.subnet-id` - The ID of the subnet involved in the association.
    #
    # - `default` - Indicates whether the ACL is the default network ACL for the VPC.
    #
    # - `entry.cidr` - The IPv4 CIDR range specified in the entry.
    #
    # - `entry.icmp.code` - The ICMP code specified in the entry, if any.
    #
    # - `entry.icmp.type` - The ICMP type specified in the entry, if any.
    #
    # - `entry.ipv6-cidr` - The IPv6 CIDR range specified in the entry.
    #
    # - `entry.port-range.from` - The start of the port range specified in the entry.
    #
    # - `entry.port-range.to` - The end of the port range specified in the entry.
    #
    # - `entry.protocol` - The protocol specified in the entry (`tcp` | `udp` | `icmp` or a protocol
    # number).
    #
    # - `entry.rule-action` - Allows or denies the matching traffic (`allow` | `deny`).
    #
    # - `entry.egress` - A Boolean that indicates the type of rule. Specify `true` for egress rules,
    # or `false` for ingress rules.
    #
    # - `entry.rule-number` - The number of an entry (in other words, rule) in the set of ACL entries.
    #
    # - `network-acl-id` - The ID of the network ACL.
    #
    # - `owner-id` - The ID of the Amazon Web Services account that owns the network ACL.
    #
    # - `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-id` - The ID of the VPC for the network ACL.
    property filters : Array(Filter) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @network_acl_ids : Array(String) | Nil = nil,
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

      (@network_acl_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkAclId.#{i}", item}
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
        network_acl_ids: node.xpath_nodes("*[local-name()='NetworkAclId']/*[local-name()='item']").map { |n| n.content },
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

    def_equals_and_hash(@next_token, @max_results, @dry_run, @network_acl_ids, @filters)
  end
end
