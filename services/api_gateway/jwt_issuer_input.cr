private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # A trusted issuer in the JWT configuration.
  class JwtIssuerInput
    include JSON::Serializable

    # The OpenID Connect (OIDC) issuer URL. The value must be an absolute `https` URL that includes a
    # host and has no user information, query, or fragment. It must exactly match the `iss` claim of
    # the token, and the issuer's OIDC discovery document must name this exact issuer.
    @[JSON::Field(key: "issuer")]
    property issuer : String

    # The audiences that the issuer can issue tokens for. None can be empty. The token's `aud` claim
    # must contain at least one of these values.
    @[JSON::Field(key: "audiences")]
    property audiences : Array(String) = [] of String

    # The additional claim rules for this issuer. Claim names must be unique within the issuer.
    @[JSON::Field(key: "additionalClaims")]
    property additional_claims : Array(JwtAdditionalClaim) | Nil

    def initialize(
      @issuer : String,
      @audiences : Array(String),
      @additional_claims : Array(JwtAdditionalClaim) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @additional_claims
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@issuer, @audiences, @additional_claims)
  end
end
