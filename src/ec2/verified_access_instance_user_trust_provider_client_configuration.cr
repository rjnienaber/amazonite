private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the trust provider.
  class VerifiedAccessInstanceUserTrustProviderClientConfiguration
    # The trust provider type.
    property type : UserTrustProviderType | Nil

    # The set of user claims to be requested from the IdP.
    property scopes : String | Nil

    # The OIDC issuer identifier of the IdP.
    property issuer : String | Nil

    # The authorization endpoint of the IdP.
    property authorization_endpoint : String | Nil

    # The public signing key endpoint.
    property public_signing_key_endpoint : String | Nil

    # The token endpoint of the IdP.
    property token_endpoint : String | Nil

    # The user info endpoint of the IdP.
    property user_info_endpoint : String | Nil

    # The OAuth 2.0 client identifier.
    property client_id : String | Nil

    # The OAuth 2.0 client secret.
    property client_secret : String | Nil

    # Indicates whether Proof of Key Code Exchange (PKCE) is enabled.
    property pkce_enabled : Bool | Nil

    def initialize(
      @type : UserTrustProviderType | Nil = nil,
      @scopes : String | Nil = nil,
      @issuer : String | Nil = nil,
      @authorization_endpoint : String | Nil = nil,
      @public_signing_key_endpoint : String | Nil = nil,
      @token_endpoint : String | Nil = nil,
      @user_info_endpoint : String | Nil = nil,
      @client_id : String | Nil = nil,
      @client_secret : String | Nil = nil,
      @pkce_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @scopes
        params << {"#{prefix}Scopes", value}
      end

      if value = @issuer
        params << {"#{prefix}Issuer", value}
      end

      if value = @authorization_endpoint
        params << {"#{prefix}AuthorizationEndpoint", value}
      end

      if value = @public_signing_key_endpoint
        params << {"#{prefix}PublicSigningKeyEndpoint", value}
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

      if value = @pkce_enabled
        params << {"#{prefix}PkceEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::UserTrustProviderType.from_json_object_key?(n.content) : nil,
        scopes: Core::XMLValue.string(node.xpath_node("*[local-name()='scopes']")),
        issuer: Core::XMLValue.string(node.xpath_node("*[local-name()='issuer']")),
        authorization_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='authorizationEndpoint']")),
        public_signing_key_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='publicSigningKeyEndpoint']")),
        token_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='tokenEndpoint']")),
        user_info_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='userInfoEndpoint']")),
        client_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientId']")),
        client_secret: Core::XMLValue.string(node.xpath_node("*[local-name()='clientSecret']")),
        pkce_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='pkceEnabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @scopes, @issuer, @authorization_endpoint, @public_signing_key_endpoint, @token_endpoint, @user_info_endpoint, @client_id, @client_secret, @pkce_enabled)
  end
end
