private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamRoutingPolicyRegistrationDeltasResult
    # The routing policy registration deltas.
    property ipam_routing_policy_registration_deltas : Array(IpamRoutingPolicyRegistrationDelta) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_routing_policy_registration_deltas : Array(IpamRoutingPolicyRegistrationDelta) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_routing_policy_registration_deltas || [] of IpamRoutingPolicyRegistrationDelta).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamRoutingPolicyRegistrationDeltaSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_routing_policy_registration_deltas: node.xpath_nodes("*[local-name()='ipamRoutingPolicyRegistrationDeltaSet']/*[local-name()='item']").map { |n| IpamRoutingPolicyRegistrationDelta.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_routing_policy_registration_deltas
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_routing_policy_registration_deltas, @next_token)
  end
end
