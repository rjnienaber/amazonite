private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeClientVpnAuthorizationRulesRequest
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The token to retrieve the next page of results.
    property next_token : String | Nil

    # One or more filters. Filter names and values are case-sensitive.
    #
    # - `description` - The description of the authorization rule.
    #
    # - `destination-cidr` - The CIDR of the network to which the authorization rule applies.
    #
    # - `group-id` - The ID of the Active Directory group to which the authorization rule grants
    # access.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the nextToken value.
    property max_results : Int32 | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @dry_run : Bool | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
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

    def_equals_and_hash(@client_vpn_endpoint_id, @dry_run, @next_token, @filters, @max_results)
  end
end
