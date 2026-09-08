private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeVpnConnections.
  class DescribeVpnConnectionsRequest
    # One or more filters.
    #
    # - `customer-gateway-configuration` - The configuration information for the customer gateway.
    #
    # - `customer-gateway-id` - The ID of a customer gateway associated with the VPN connection.
    #
    # - `state` - The state of the VPN connection (`pending` | `available` | `deleting` | `deleted`).
    #
    # - `option.static-routes-only` - Indicates whether the connection has static routes only. Used
    # for devices that do not support Border Gateway Protocol (BGP).
    #
    # - `route.destination-cidr-block` - The destination CIDR block. This corresponds to the subnet
    # used in a customer data center.
    #
    # - `bgp-asn` - The BGP Autonomous System Number (ASN) associated with a BGP device.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `type` - The type of VPN connection. Currently the only supported type is `ipsec.1`.
    #
    # - `vpn-connection-id` - The ID of the VPN connection.
    #
    # - `vpn-gateway-id` - The ID of a virtual private gateway associated with the VPN connection.
    #
    # - `transit-gateway-id` - The ID of a transit gateway associated with the VPN connection.
    property filters : Array(Filter) | Nil

    # One or more VPN connection IDs.
    #
    # Default: Describes your VPN connections.
    property vpn_connection_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
      @vpn_connection_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@vpn_connection_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpnConnectionId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        vpn_connection_ids: node.xpath_nodes("*[local-name()='VpnConnectionId']/*[local-name()='VpnConnectionId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@filters, @vpn_connection_ids, @dry_run)
  end
end
