private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAddressesRequest
    # One or more Elastic IP addresses.
    #
    # Default: Describes all your Elastic IP addresses.
    property public_ips : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters. Filter names and values are case-sensitive.
    #
    # - `allocation-id` - The allocation ID for the address.
    #
    # - `association-id` - The association ID for the address.
    #
    # - `instance-id` - The ID of the instance the address is associated with, if any.
    #
    # - `network-border-group` - A unique set of Availability Zones, Local Zones, or Wavelength Zones
    # from where Amazon Web Services advertises IP addresses.
    #
    # - `network-interface-id` - The ID of the network interface that the address is associated with,
    # if any.
    #
    # - `network-interface-owner-id` - The Amazon Web Services account ID of the owner.
    #
    # - `private-ip-address` - The private IP address associated with the Elastic IP address.
    #
    # - `public-ip` - The Elastic IP address, or the carrier IP address.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    # Information about the allocation IDs.
    property allocation_ids : Array(String) | Nil

    def initialize(
      @public_ips : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @allocation_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@public_ips || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PublicIp.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@allocation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AllocationId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_ips: node.xpath_nodes("*[local-name()='PublicIp']/*[local-name()='PublicIp']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        allocation_ids: node.xpath_nodes("*[local-name()='AllocationId']/*[local-name()='AllocationId']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@public_ips, @dry_run, @filters, @allocation_ids)
  end
end
