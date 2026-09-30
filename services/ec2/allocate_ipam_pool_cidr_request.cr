private alias Core = Amazonite::Core

module Amazonite::EC2
  class AllocateIpamPoolCidrRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM pool from which you would like to allocate a CIDR.
    property ipam_pool_id : String

    # The CIDR you would like to allocate from the IPAM pool. Note the following:
    #
    # - If there is no DefaultNetmaskLength allocation rule set on the pool, you must specify either
    # the NetmaskLength or the CIDR.
    #
    # - If the DefaultNetmaskLength allocation rule is set on the pool, you can specify either the
    # NetmaskLength or the CIDR and the DefaultNetmaskLength allocation rule will be ignored.
    #
    # Possible values: Any available IPv4 or IPv6 CIDR.
    property cidr : String | Nil

    # The netmask length of the CIDR you would like to allocate from the IPAM pool. Note the
    # following:
    #
    # - If there is no DefaultNetmaskLength allocation rule set on the pool, you must specify either
    # the NetmaskLength or the CIDR.
    #
    # - If the DefaultNetmaskLength allocation rule is set on the pool, you can specify either the
    # NetmaskLength or the CIDR and the DefaultNetmaskLength allocation rule will be ignored.
    #
    # Possible netmask lengths for IPv4 addresses are 0 - 32. Possible netmask lengths for IPv6
    # addresses are 0 - 128.
    property netmask_length : Int32 | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # A description for the allocation.
    property description : String | Nil

    # A preview of the next available CIDR in a pool.
    property preview_next_cidr : Bool | Nil

    # Include a particular CIDR range that can be returned by the pool. Allowed CIDRs are only allowed
    # if using netmask length for allocation.
    property allowed_cidrs : Array(String) | Nil

    # Exclude a particular CIDR range from being returned by the pool. Disallowed CIDRs are only
    # allowed if using netmask length for allocation.
    property disallowed_cidrs : Array(String) | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    #
    # If you specify tags, the request is authorized against the allocation resource in addition to
    # the pool resource.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @ipam_pool_id : String,
      @dry_run : Bool | Nil = nil,
      @cidr : String | Nil = nil,
      @netmask_length : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @description : String | Nil = nil,
      @preview_next_cidr : Bool | Nil = nil,
      @allowed_cidrs : Array(String) | Nil = nil,
      @disallowed_cidrs : Array(String) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @netmask_length
        params << {"#{prefix}NetmaskLength", value.to_s}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @preview_next_cidr
        params << {"#{prefix}PreviewNextCidr", Core::QueryValue.bool(value)}
      end

      (@allowed_cidrs || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AllowedCidr.#{i}", item}
      end

      (@disallowed_cidrs || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DisallowedCidr.#{i}", item}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")),
        netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='NetmaskLength']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        preview_next_cidr: Core::XMLValue.bool(node.xpath_node("*[local-name()='PreviewNextCidr']")),
        allowed_cidrs: node.xpath_nodes("*[local-name()='AllowedCidr']/*[local-name()='item']").map { |n| n.content },
        disallowed_cidrs: node.xpath_nodes("*[local-name()='DisallowedCidr']/*[local-name()='item']").map { |n| n.content },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_pool_id, @cidr, @netmask_length, @client_token, @description, @preview_next_cidr, @allowed_cidrs, @disallowed_cidrs, @tag_specifications)
  end
end
