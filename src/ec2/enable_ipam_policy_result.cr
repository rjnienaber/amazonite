private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableIpamPolicyResult
    # The ID of the IPAM policy that was enabled.
    property ipam_policy_id : String | Nil

    def initialize(
      @ipam_policy_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_policy_id
        params << {"#{prefix}IpamPolicyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPolicyId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipam_policy_id)
  end
end
