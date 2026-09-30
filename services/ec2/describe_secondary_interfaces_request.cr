private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecondaryInterfacesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `attachment.attachment-id` - The ID of the secondary interface attachment.
    #
    # - `attachment.instance-id` - The ID of the instance to which the secondary interface is
    # attached.
    #
    # - `attachment.instance-owner-id` - The ID of the Amazon Web Services account that owns the
    # instance to which the secondary interface is attached.
    #
    # - `attachment.status` - The attachment status (`attaching` | `attached` | `detaching` |
    # `detached`).
    #
    # - `private-ipv4-addresses.private-ip-address` - The private IPv4 address associated with the
    # secondary interface.
    #
    # - `owner-id` - The ID of the Amazon Web Services account that owns the secondary interface.
    #
    # - `secondary-interface-arn` - The ARN of the secondary interface.
    #
    # - `secondary-interface-id` - The ID of the secondary interface.
    #
    # - `secondary-interface-type` - The type of secondary interface (`secondary`).
    #
    # - `secondary-network-id` - The ID of the secondary network.
    #
    # - `secondary-network-type` - The type of the secondary network (`rdma`).
    #
    # - `secondary-subnet-id` - The ID of the secondary subnet.
    #
    # - `status` - The status of the secondary interface (`available` | `in-use`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # The IDs of the secondary interfaces.
    property secondary_interface_ids : Array(String) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @secondary_interface_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@secondary_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecondaryInterfaceId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        secondary_interface_ids: node.xpath_nodes("*[local-name()='SecondaryInterfaceId']/*[local-name()='item']").map { |n| n.content },
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

    def_equals_and_hash(@dry_run, @filters, @max_results, @next_token, @secondary_interface_ids)
  end
end
