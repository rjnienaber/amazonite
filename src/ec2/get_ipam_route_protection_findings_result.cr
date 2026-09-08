private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamRouteProtectionFindingsResult
    # The ID of the IPAM.
    property ipam_id : String | Nil

    # The route protection findings.
    property route_protection_findings : Array(IpamRouteProtectionFinding) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_id : String | Nil = nil,
      @route_protection_findings : Array(IpamRouteProtectionFinding) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end

      (@route_protection_findings || [] of IpamRouteProtectionFinding).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteProtectionFindingSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        route_protection_findings: node.xpath_nodes("*[local-name()='routeProtectionFindingSet']/*[local-name()='item']").map { |n| IpamRouteProtectionFinding.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @route_protection_findings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_id, @route_protection_findings, @next_token)
  end
end
