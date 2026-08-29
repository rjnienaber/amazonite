private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetFederationTokenResponse
    property credentials : Credentials | Nil

    property federated_user : FederatedUser | Nil

    property packed_policy_size : Int32 | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @federated_user : FederatedUser | Nil = nil,
      @packed_policy_size : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @federated_user
        params.concat(value.to_query_params("#{prefix}FederatedUser."))
      end

      if value = @packed_policy_size
        params << {"#{prefix}PackedPolicySize", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        federated_user: node.xpath_node("*[local-name()='FederatedUser']").try { |n| FederatedUser.from_xml(n) },
        packed_policy_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='PackedPolicySize']")),
      )
    end
  end
end
