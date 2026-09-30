private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecurityGroupsRequest
    # The IDs of the security groups. Required for security groups in a nondefault VPC.
    #
    # Default: Describes all of your security groups.
    property group_ids : Array(String) | Nil

    # [Default VPC] The names of the security groups. You can specify either the security group name
    # or the security group ID.
    #
    # Default: Describes all of your security groups.
    property group_names : Array(String) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. This value can be between 5 and 1000. If
    # this parameter is not specified, then all items are returned. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters. If using multiple filters for rules, the results include security groups for which
    # any combination of rules - not necessarily a single rule - match all filters.
    #
    # - `description` - The description of the security group.
    #
    # - `egress.ip-permission.cidr` - An IPv4 CIDR block for an outbound security group rule.
    #
    # - `egress.ip-permission.from-port` - For an outbound rule, the start of port range for the TCP
    # and UDP protocols, or an ICMP type number.
    #
    # - `egress.ip-permission.group-id` - The ID of a security group that has been referenced in an
    # outbound security group rule.
    #
    # - `egress.ip-permission.group-name` - The name of a security group that is referenced in an
    # outbound security group rule.
    #
    # - `egress.ip-permission.ipv6-cidr` - An IPv6 CIDR block for an outbound security group rule.
    #
    # - `egress.ip-permission.prefix-list-id` - The ID of a prefix list to which a security group rule
    # allows outbound access.
    #
    # - `egress.ip-permission.protocol` - The IP protocol for an outbound security group rule (`tcp` |
    # `udp` | `icmp`, a protocol number, or -1 for all protocols).
    #
    # - `egress.ip-permission.to-port` - For an outbound rule, the end of port range for the TCP and
    # UDP protocols, or an ICMP code.
    #
    # - `egress.ip-permission.user-id` - The ID of an Amazon Web Services account that has been
    # referenced in an outbound security group rule.
    #
    # - `group-id` - The ID of the security group.
    #
    # - `group-name` - The name of the security group.
    #
    # - `ip-permission.cidr` - An IPv4 CIDR block for an inbound security group rule.
    #
    # - `ip-permission.from-port` - For an inbound rule, the start of port range for the TCP and UDP
    # protocols, or an ICMP type number.
    #
    # - `ip-permission.group-id` - The ID of a security group that has been referenced in an inbound
    # security group rule.
    #
    # - `ip-permission.group-name` - The name of a security group that is referenced in an inbound
    # security group rule.
    #
    # - `ip-permission.ipv6-cidr` - An IPv6 CIDR block for an inbound security group rule.
    #
    # - `ip-permission.prefix-list-id` - The ID of a prefix list from which a security group rule
    # allows inbound access.
    #
    # - `ip-permission.protocol` - The IP protocol for an inbound security group rule (`tcp` | `udp` |
    # `icmp`, a protocol number, or -1 for all protocols).
    #
    # - `ip-permission.to-port` - For an inbound rule, the end of port range for the TCP and UDP
    # protocols, or an ICMP code.
    #
    # - `ip-permission.user-id` - The ID of an Amazon Web Services account that has been referenced in
    # an inbound security group rule.
    #
    # - `owner-id` - The Amazon Web Services account ID of the owner of the security group.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-id` - The ID of the VPC specified when the security group was created.
    property filters : Array(Filter) | Nil

    def initialize(
      @group_ids : Array(String) | Nil = nil,
      @group_names : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupId.#{i}", item}
      end

      (@group_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupName.#{i}", item}
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

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_ids: node.xpath_nodes("*[local-name()='GroupId']/*[local-name()='groupId']").map { |n| n.content },
        group_names: node.xpath_nodes("*[local-name()='GroupName']/*[local-name()='GroupName']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
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

    def_equals_and_hash(@group_ids, @group_names, @next_token, @max_results, @dry_run, @filters)
  end
end
