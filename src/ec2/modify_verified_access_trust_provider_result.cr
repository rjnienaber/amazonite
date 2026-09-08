private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessTrustProviderResult
    # Details about the Verified Access trust provider.
    property verified_access_trust_provider : VerifiedAccessTrustProvider | Nil

    def initialize(
      @verified_access_trust_provider : VerifiedAccessTrustProvider | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_trust_provider
        params.concat(value.to_query_params("#{prefix}VerifiedAccessTrustProvider."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_trust_provider: node.xpath_node("*[local-name()='verifiedAccessTrustProvider']").try { |n| VerifiedAccessTrustProvider.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @verified_access_trust_provider
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_trust_provider)
  end
end
