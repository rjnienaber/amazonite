private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetWebIdentityTokenResponse
    # A signed JSON Web Token (JWT) that represents the caller's Amazon Web Services identity. The
    # token contains standard JWT claims such as subject, audience, expiration time, and additional
    # identity attributes added by STS as custom claims. You can also add your own custom claims to
    # the token by passing tags as request parameters to the `GetWebIdentityToken` API. The token is
    # signed using the specified signing algorithm and can be verified using the verification keys
    # available at the issuer's JWKS endpoint.
    property web_identity_token : String | Nil

    # The date and time when the web identity token expires, in UTC. The expiration is determined by
    # adding the `DurationSeconds` value to the time the token was issued. After this time, the token
    # should no longer be considered valid.
    property expiration : Time | Nil

    def initialize(
      @web_identity_token : String | Nil = nil,
      @expiration : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @web_identity_token
        params << {"#{prefix}WebIdentityToken", value}
      end

      if value = @expiration
        params << {"#{prefix}Expiration", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        web_identity_token: Core::XMLValue.string(node.xpath_node("*[local-name()='WebIdentityToken']")),
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='Expiration']")),
      )
    end
  end
end
