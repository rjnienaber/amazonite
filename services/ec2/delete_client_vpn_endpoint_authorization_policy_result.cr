private alias AEC = Amazonite::EC2

module Amazonite::EC2
  class DeleteClientVpnEndpointAuthorizationPolicyResult
    # The current state of the authorization policy.
    property status : ClientVpnAuthorizationPolicyStatus | Nil

    def initialize(
      @status : ClientVpnAuthorizationPolicyStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ClientVpnAuthorizationPolicyStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
