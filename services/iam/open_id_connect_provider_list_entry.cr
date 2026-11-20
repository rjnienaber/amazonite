private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the Amazon Resource Name (ARN) for an IAM OpenID Connect provider.
  class OpenIDConnectProviderListEntry
    property arn : String | Nil

    # Specifies whether trusted identity propagation is enabled for the OpenID Connect (OIDC)
    # provider. This is `true` when an IAM Identity Center instance is associated with the provider.
    property is_trusted_identity_propagation_enabled : Bool | Nil

    def initialize(
      @arn : String | Nil = nil,
      @is_trusted_identity_propagation_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @is_trusted_identity_propagation_enabled
        params << {"#{prefix}IsTrustedIdentityPropagationEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        is_trusted_identity_propagation_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTrustedIdentityPropagationEnabled']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@arn, @is_trusted_identity_propagation_enabled)
  end
end
