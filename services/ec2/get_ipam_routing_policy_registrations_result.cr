private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamRoutingPolicyRegistrationsResult
    # The routing policy registrations.
    property ipam_routing_policy_registrations : Array(IpamRoutingPolicyRegistration) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_routing_policy_registrations : Array(IpamRoutingPolicyRegistration) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_routing_policy_registrations || [] of IpamRoutingPolicyRegistration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamRoutingPolicyRegistrationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_routing_policy_registrations: node.xpath_nodes("*[local-name()='ipamRoutingPolicyRegistrationSet']/*[local-name()='item']").map { |n| IpamRoutingPolicyRegistration.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_routing_policy_registrations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_routing_policy_registrations, @next_token)
  end
end
