private alias Core = Amazonite::Core

module Amazonite::Iam
  class GetOutboundWebIdentityFederationInfoResponse
    # A unique issuer URL for your Amazon Web Services account that hosts the OpenID Connect (OIDC)
    # discovery endpoints at `/.well-known/openid-configuration and /.well-known/jwks.json`. The
    # OpenID Connect (OIDC) discovery endpoints contain verification keys and metadata necessary for
    # token verification.
    property issuer_identifier : String | Nil

    # Indicates whether outbound identity federation is currently enabled for your Amazon Web Services
    # account. When true, IAM principals in the account can call the `GetWebIdentityToken` API to
    # obtain JSON Web Tokens (JWTs) for authentication with external services.
    property jwt_vending_enabled : Bool | Nil

    def initialize(
      @issuer_identifier : String | Nil = nil,
      @jwt_vending_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @issuer_identifier
        params << {"#{prefix}IssuerIdentifier", value}
      end

      if value = @jwt_vending_enabled
        params << {"#{prefix}JwtVendingEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        issuer_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='IssuerIdentifier']")),
        jwt_vending_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='JwtVendingEnabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@issuer_identifier, @jwt_vending_enabled)
  end
end
