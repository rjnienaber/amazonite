private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamRouteOriginAuthorizationsResult
    # The Route Origin Authorizations published to the RPKI.
    property ipam_route_origin_authorizations : Array(IpamRouteOriginAuthorizationInfo) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_route_origin_authorizations : Array(IpamRouteOriginAuthorizationInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_route_origin_authorizations || [] of IpamRouteOriginAuthorizationInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamRouteOriginAuthorizationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_route_origin_authorizations: node.xpath_nodes("*[local-name()='ipamRouteOriginAuthorizationSet']/*[local-name()='item']").map { |n| IpamRouteOriginAuthorizationInfo.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_route_origin_authorizations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_route_origin_authorizations, @next_token)
  end
end
