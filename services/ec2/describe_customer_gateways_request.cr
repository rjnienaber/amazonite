private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeCustomerGateways.
  class DescribeCustomerGatewaysRequest
    # One or more customer gateway IDs.
    #
    # Default: Describes all your customer gateways.
    property customer_gateway_ids : Array(String) | Nil

    # One or more filters.
    #
    # - `bgp-asn` - The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number
    # (ASN).
    #
    # - `customer-gateway-id` - The ID of the customer gateway.
    #
    # - `ip-address` - The IP address of the customer gateway device's external interface.
    #
    # - `state` - The state of the customer gateway (`pending` | `available` | `deleting` |
    # `deleted`).
    #
    # - `type` - The type of customer gateway. Currently, the only supported type is `ipsec.1`.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @customer_gateway_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@customer_gateway_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CustomerGatewayId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        customer_gateway_ids: node.xpath_nodes("*[local-name()='CustomerGatewayId']/*[local-name()='CustomerGatewayId']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@customer_gateway_ids, @filters, @dry_run)
  end
end
