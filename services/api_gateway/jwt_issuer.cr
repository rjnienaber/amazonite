private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # A trusted issuer in the returned JWT configuration.
  class JwtIssuer
    include JSON::Serializable

    # The OpenID Connect (OIDC) issuer URL.
    @[JSON::Field(key: "issuer")]
    property issuer : String | Nil

    # The audiences that the issuer can issue tokens for.
    @[JSON::Field(key: "audiences")]
    property audiences : Array(String) | Nil

    # The additional claim rules configured for this issuer.
    @[JSON::Field(key: "additionalClaims")]
    property additional_claims : Array(JwtAdditionalClaim) | Nil

    # The JSON Web Key Set (JWKS) URI that API Gateway resolved from the issuer's OpenID Connect
    # discovery document. This value is read-only and cannot be set.
    @[JSON::Field(key: "jwksUri")]
    property jwks_uri : String | Nil

    def initialize(
      @issuer : String | Nil = nil,
      @audiences : Array(String) | Nil = nil,
      @additional_claims : Array(JwtAdditionalClaim) | Nil = nil,
      @jwks_uri : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @additional_claims
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@issuer, @audiences, @additional_claims, @jwks_uri)
  end
end
