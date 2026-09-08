private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSubnetsRequest
    # The filters.
    #
    # - `availability-zone` - The Availability Zone for the subnet. You can also use
    # `availabilityZone` as the filter name.
    #
    # - `availability-zone-id` - The ID of the Availability Zone for the subnet. You can also use
    # `availabilityZoneId` as the filter name.
    #
    # - `available-ip-address-count` - The number of IPv4 addresses in the subnet that are available.
    #
    # - `cidr-block` - The IPv4 CIDR block of the subnet. The CIDR block you specify must exactly
    # match the subnet's CIDR block for information to be returned for the subnet. You can also use
    # `cidr` or `cidrBlock` as the filter names.
    #
    # - `customer-owned-ipv4-pool` - The customer-owned IPv4 address pool associated with the subnet.
    #
    # - `default-for-az` - Indicates whether this is the default subnet for the Availability Zone
    # (`true` | `false`). You can also use `defaultForAz` as the filter name.
    #
    # - `enable-dns64` - Indicates whether DNS queries made to the Amazon-provided DNS Resolver in
    # this subnet should return synthetic IPv6 addresses for IPv4-only destinations.
    #
    # - `enable-lni-at-device-index` - Indicates the device position for local network interfaces in
    # this subnet. For example, `1` indicates local network interfaces in this subnet are the
    # secondary network interface (eth1).
    #
    # - `ipv6-cidr-block-association.ipv6-cidr-block` - An IPv6 CIDR block associated with the subnet.
    #
    # - `ipv6-cidr-block-association.association-id` - An association ID for an IPv6 CIDR block
    # associated with the subnet.
    #
    # - `ipv6-cidr-block-association.state` - The state of an IPv6 CIDR block associated with the
    # subnet.
    #
    # - `ipv6-native` - Indicates whether this is an IPv6 only subnet (`true` | `false`).
    #
    # - `map-customer-owned-ip-on-launch` - Indicates whether a network interface created in this
    # subnet (including a network interface created by RunInstances) receives a customer-owned IPv4
    # address.
    #
    # - `map-public-ip-on-launch` - Indicates whether instances launched in this subnet receive a
    # public IPv4 address.
    #
    # - `outpost-arn` - The Amazon Resource Name (ARN) of the Outpost.
    #
    # - `owner-id` - The ID of the Amazon Web Services account that owns the subnet.
    #
    # - `private-dns-name-options-on-launch.hostname-type` - The type of hostname to assign to
    # instances in the subnet at launch. For IPv4-only and dual-stack (IPv4 and IPv6) subnets, an
    # instance DNS name can be based on the instance IPv4 address (ip-name) or the instance ID
    # (resource-name). For IPv6 only subnets, an instance DNS name must be based on the instance ID
    # (resource-name).
    #
    # - `private-dns-name-options-on-launch.enable-resource-name-dns-a-record` - Indicates whether to
    # respond to DNS queries for instance hostnames with DNS A records.
    #
    # - `private-dns-name-options-on-launch.enable-resource-name-dns-aaaa-record` - Indicates whether
    # to respond to DNS queries for instance hostnames with DNS AAAA records.
    #
    # - `state` - The state of the subnet (`pending` | `available`).
    #
    # - `subnet-arn` - The Amazon Resource Name (ARN) of the subnet.
    #
    # - `subnet-id` - The ID of the subnet.
    #
    # - `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-id` - The ID of the VPC for the subnet.
    property filters : Array(Filter) | Nil

    # The IDs of the subnets.
    #
    # Default: Describes all your subnets.
    property subnet_ids : Array(String) | Nil

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
      @subnet_ids : Array(String) | Nil = nil,
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

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetId.#{i}", item}
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
        subnet_ids: node.xpath_nodes("*[local-name()='SubnetId']/*[local-name()='SubnetId']").map { |n| n.content },
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

    def_equals_and_hash(@filters, @subnet_ids, @next_token, @max_results, @dry_run)
  end
end
