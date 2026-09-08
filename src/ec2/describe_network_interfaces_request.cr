private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeNetworkInterfaces.
  class DescribeNetworkInterfacesRequest
    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. You cannot specify this parameter and the
    # network interface IDs parameter in the same request. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # Indicates whether to include managed resources in the output. If this parameter is set to
    # `true`, the output includes resources that are managed by Amazon Web Services services, even if
    # managed resource visibility is set to hidden.
    property include_managed_resources : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The network interface IDs.
    #
    # Default: Describes all your network interfaces.
    property network_interface_ids : Array(String) | Nil

    # One or more filters.
    #
    # - `association.allocation-id` - The allocation ID returned when you allocated the Elastic IP
    # address (IPv4) for your network interface.
    #
    # - `association.association-id` - The association ID returned when the network interface was
    # associated with an IPv4 address.
    #
    # - `addresses.association.owner-id` - The owner ID of the addresses associated with the network
    # interface.
    #
    # - `addresses.association.public-ip` - The association ID returned when the network interface was
    # associated with the Elastic IP address (IPv4).
    #
    # - `addresses.primary` - Whether the private IPv4 address is the primary IP address associated
    # with the network interface.
    #
    # - `addresses.private-ip-address` - The private IPv4 addresses associated with the network
    # interface.
    #
    # - `association.ip-owner-id` - The owner of the Elastic IP address (IPv4) associated with the
    # network interface.
    #
    # - `association.public-ip` - The address of the Elastic IP address (IPv4) bound to the network
    # interface.
    #
    # - `association.public-dns-name` - The public DNS name for the network interface (IPv4).
    #
    # - `attachment.attach-time` - The time that the network interface was attached to an instance.
    #
    # - `attachment.attachment-id` - The ID of the interface attachment.
    #
    # - `attachment.delete-on-termination` - Indicates whether the attachment is deleted when an
    # instance is terminated.
    #
    # - `attachment.device-index` - The device index to which the network interface is attached.
    #
    # - `attachment.instance-id` - The ID of the instance to which the network interface is attached.
    #
    # - `attachment.instance-owner-id` - The owner ID of the instance to which the network interface
    # is attached.
    #
    # - `attachment.status` - The status of the attachment (`attaching` | `attached` | `detaching` |
    # `detached`).
    #
    # - `availability-zone` - The Availability Zone of the network interface.
    #
    # - `availability-zone-id` - The ID of the Availability Zone of the network interface.
    #
    # - `description` - The description of the network interface.
    #
    # - `group-id` - The ID of a security group associated with the network interface.
    #
    # - `ipv6-addresses.ipv6-address` - An IPv6 address associated with the network interface.
    #
    # - `interface-type` - The type of network interface (`api_gateway_managed` |
    # `aws_codestar_connections_managed` | `branch` | `ec2_instance_connect_endpoint` | `efa` |
    # `efa-only` | `efs` | `evs` | `gateway_load_balancer` | `gateway_load_balancer_endpoint` |
    # `global_accelerator_managed` | `interface` | `iot_rules_managed` | `lambda` | `load_balancer` |
    # `nat_gateway` | `network_load_balancer` | `quicksight` | `transit_gateway` | `trunk` |
    # `vpc_endpoint`).
    #
    # - `mac-address` - The MAC address of the network interface.
    #
    # - `network-interface-id` - The ID of the network interface.
    #
    # - `operator.managed` - A Boolean that indicates whether this is a managed network interface.
    #
    # - `operator.principal` - The principal that manages the network interface. Only valid for
    # managed network interfaces, where `managed` is `true`.
    #
    # - `owner-id` - The Amazon Web Services account ID of the network interface owner.
    #
    # - `private-dns-name` - The private DNS name of the network interface (IPv4).
    #
    # - `private-ip-address` - The private IPv4 address or addresses of the network interface.
    #
    # - `requester-id` - The alias or Amazon Web Services account ID of the principal or service that
    # created the network interface.
    #
    # - `requester-managed` - Indicates whether the network interface is being managed by an Amazon
    # Web Services service (for example, Amazon Web Services Management Console, Auto Scaling, and so
    # on).
    #
    # - `source-dest-check` - Indicates whether the network interface performs source/destination
    # checking. A value of `true` means checking is enabled, and `false` means checking is disabled.
    # The value must be `false` for the network interface to perform network address translation (NAT)
    # in your VPC.
    #
    # - `status` - The status of the network interface. If the network interface is not attached to an
    # instance, the status is `available`; if a network interface is attached to an instance the
    # status is `in-use`.
    #
    # - `subnet-id` - The ID of the subnet for the network interface.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-id` - The ID of the VPC for the network interface.
    property filters : Array(Filter) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @network_interface_ids : Array(String) | Nil = nil,
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

      if value = @include_managed_resources
        params << {"#{prefix}IncludeManagedResources", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@network_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInterfaceId.#{i}", item}
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
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_interface_ids: node.xpath_nodes("*[local-name()='NetworkInterfaceId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
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

    def_equals_and_hash(@next_token, @max_results, @include_managed_resources, @dry_run, @network_interface_ids, @filters)
  end
end
