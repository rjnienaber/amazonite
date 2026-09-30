private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the options for an OpenID Connect-compatible user-identity trust provider.
  class OidcOptions
    # The OIDC issuer.
    property issuer : String | Nil

    # The OIDC authorization endpoint.
    property authorization_endpoint : String | Nil

    # The OIDC token endpoint.
    property token_endpoint : String | Nil

    # The OIDC user info endpoint.
    property user_info_endpoint : String | Nil

    # The client identifier.
    property client_id : String | Nil

    # The client secret.
    property client_secret : String | Nil

    # The OpenID Connect (OIDC) scope specified.
    property scope : String | Nil

    def initialize(
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
        issuer: Core::XMLValue.string(node.xpath_node("*[local-name()='issuer']")),
        authorization_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='authorizationEndpoint']")),
        token_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='tokenEndpoint']")),
        user_info_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='userInfoEndpoint']")),
        client_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientId']")),
        client_secret: Core::XMLValue.string(node.xpath_node("*[local-name()='clientSecret']")),
        scope: Core::XMLValue.string(node.xpath_node("*[local-name()='scope']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@issuer, @authorization_endpoint, @token_endpoint, @user_info_endpoint, @client_id, @client_secret, @scope)
  end
end
