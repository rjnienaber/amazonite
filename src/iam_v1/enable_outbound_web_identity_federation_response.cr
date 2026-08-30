private alias Core = Amazonite::Core

module Amazonite::IamV1
  class EnableOutboundWebIdentityFederationResponse
    # A unique issuer URL for your Amazon Web Services account that hosts the OpenID Connect (OIDC)
    # discovery endpoints at `/.well-known/openid-configuration and /.well-known/jwks.json`. The
    # OpenID Connect (OIDC) discovery endpoints contain verification keys and metadata necessary for
    # token verification.
    property issuer_identifier : String | Nil

    def initialize(
      @issuer_identifier : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @issuer_identifier
        params << {"#{prefix}IssuerIdentifier", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        issuer_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='IssuerIdentifier']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@issuer_identifier)
  end
end
