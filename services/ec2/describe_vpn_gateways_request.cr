private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeVpnGateways.
  class DescribeVpnGatewaysRequest
    # One or more filters.
    #
    # - `amazon-side-asn` - The Autonomous System Number (ASN) for the Amazon side of the gateway.
    #
    # - `attachment.state` - The current state of the attachment between the gateway and the VPC
    # (`attaching` | `attached` | `detaching` | `detached`).
    #
    # - `attachment.vpc-id` - The ID of an attached VPC.
    #
    # - `availability-zone` - The Availability Zone for the virtual private gateway (if applicable).
    #
    # - `state` - The state of the virtual private gateway (`pending` | `available` | `deleting` |
    # `deleted`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `type` - The type of virtual private gateway. Currently the only supported type is `ipsec.1`.
    #
    # - `vpn-gateway-id` - The ID of the virtual private gateway.
    property filters : Array(Filter) | Nil

    # One or more virtual private gateway IDs.
    #
    # Default: Describes all your virtual private gateways.
    property vpn_gateway_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
      @vpn_gateway_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@vpn_gateway_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpnGatewayId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        vpn_gateway_ids: node.xpath_nodes("*[local-name()='VpnGatewayId']/*[local-name()='VpnGatewayId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@filters, @vpn_gateway_ids, @dry_run)
  end
end
