private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetEnabledIpamPolicyResult
    # Indicates whether the IPAM policy is enabled.
    property ipam_policy_enabled : Bool | Nil

    # The ID of the enabled IPAM policy.
    property ipam_policy_id : String | Nil

    # The entity that manages the IPAM policy.
    property managed_by : IpamPolicyManagedBy | Nil

    def initialize(
      @ipam_policy_enabled : Bool | Nil = nil,
      @ipam_policy_id : String | Nil = nil,
      @managed_by : IpamPolicyManagedBy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_policy_enabled
        params << {"#{prefix}IpamPolicyEnabled", Core::QueryValue.bool(value)}
      end

      if value = @ipam_policy_id
        params << {"#{prefix}IpamPolicyId", value}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_policy_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='ipamPolicyEnabled']")),
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPolicyId']")),
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::IpamPolicyManagedBy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipam_policy_enabled, @ipam_policy_id, @managed_by)
  end
end
