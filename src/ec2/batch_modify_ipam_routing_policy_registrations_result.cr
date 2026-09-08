private alias Core = Amazonite::Core

module Amazonite::EC2
  class BatchModifyIpamRoutingPolicyRegistrationsResult
    # Information about the routing policy registration delta created by this batch operation.
    property ipam_routing_policy_registration_delta : IpamRoutingPolicyRegistrationDelta | Nil

    def initialize(
      @ipam_routing_policy_registration_delta : IpamRoutingPolicyRegistrationDelta | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_routing_policy_registration_delta
        params.concat(value.to_query_params("#{prefix}IpamRoutingPolicyRegistrationDelta."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_routing_policy_registration_delta: node.xpath_node("*[local-name()='ipamRoutingPolicyRegistrationDelta']").try { |n| IpamRoutingPolicyRegistrationDelta.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_routing_policy_registration_delta
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_routing_policy_registration_delta)
  end
end
