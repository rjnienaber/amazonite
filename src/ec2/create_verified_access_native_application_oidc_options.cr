private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the OpenID Connect (OIDC) options.
  class CreateVerifiedAccessNativeApplicationOidcOptions
    # The public signing key endpoint.
    property public_signing_key_endpoint : String | Nil

    # The OIDC issuer identifier of the IdP.
    property issuer : String | Nil

    # The authorization endpoint of the IdP.
    property authorization_endpoint : String | Nil

    # The token endpoint of the IdP.
    property token_endpoint : String | Nil

    # The user info endpoint of the IdP.
    property user_info_endpoint : String | Nil

    # The OAuth 2.0 client identifier.
    property client_id : String | Nil

    # The OAuth 2.0 client secret.
    property client_secret : String | Nil

    # The set of user claims to be requested from the IdP.
    property scope : String | Nil

    def initialize(
      @public_signing_key_endpoint : String | Nil = nil,
      @issuer : String | Nil = nil,
      @authorization_endpoint : String | Nil = nil,
      @token_endpoint : String | Nil = nil,
      @user_info_endpoint : String | Nil = nil,
      @client_id : String | Nil = nil,
      @client_secret : String | Nil = nil,
      @scope : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_signing_key_endpoint
        params << {"#{prefix}PublicSigningKeyEndpoint", value}
      end

      if value = @issuer
        params << {"#{prefix}Issuer", value}
      end

      if value = @authorization_endpoint
        params << {"#{prefix}AuthorizationEndpoint", value}
      end

      if value = @token_endpoint
        params << {"#{prefix}TokenEndpoint", value}
      end

      if value = @user_info_endpoint
        params << {"#{prefix}UserInfoEndpoint", value}
      end

      if value = @client_id
        params << {"#{prefix}ClientId", value}
      end

      if value = @client_secret
        params << {"#{prefix}ClientSecret", value}
      end

      if value = @scope
        params << {"#{prefix}Scope", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_signing_key_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicSigningKeyEndpoint']")),
        issuer: Core::XMLValue.string(node.xpath_node("*[local-name()='Issuer']")),
        authorization_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='AuthorizationEndpoint']")),
        token_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='TokenEndpoint']")),
        user_info_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='UserInfoEndpoint']")),
        client_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientId']")),
        client_secret: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientSecret']")),
        scope: Core::XMLValue.string(node.xpath_node("*[local-name()='Scope']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@public_signing_key_endpoint, @issuer, @authorization_endpoint, @token_endpoint, @user_info_endpoint, @client_id, @client_secret, @scope)
  end
end
