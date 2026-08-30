private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetDelegatedAccessTokenResponse
    property credentials : Credentials | Nil

    # The percentage of the maximum policy size that is used by the session policy. The policy size is
    # calculated as the sum of all the session policies and permission boundaries attached to the
    # session. If the packed size exceeds 100%, the request fails.
    property packed_policy_size : Int32 | Nil

    # The Amazon Resource Name (ARN) of the principal that was assumed when obtaining the delegated
    # access token. This ARN identifies the IAM entity whose permissions are granted by the temporary
    # credentials.
    property assumed_principal : String | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @packed_policy_size : Int32 | Nil = nil,
      @assumed_principal : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @packed_policy_size
        params << {"#{prefix}PackedPolicySize", value.to_s}
      end

      if value = @assumed_principal
        params << {"#{prefix}AssumedPrincipal", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        packed_policy_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='PackedPolicySize']")),
        assumed_principal: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumedPrincipal']")),
      )
    end

    def_equals_and_hash(@credentials, @packed_policy_size, @assumed_principal)
  end
end
