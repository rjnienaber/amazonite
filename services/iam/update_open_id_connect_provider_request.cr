private alias Core = Amazonite::Core

module Amazonite::Iam
  class UpdateOpenIDConnectProviderRequest
    # The Amazon Resource Name (ARN) of the IAM OIDC provider resource object to update. You can get a
    # list of OIDC provider resource ARNs by using the
    # [ListOpenIDConnectProviders](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html)
    # operation.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property open_id_connect_provider_arn : String

    # The trusted identity propagation context provider configuration to set on the OIDC provider.
    # This configuration defines the subject mapping and the source-to-target key mappings that are
    # used when trusted context is injected. For more information, see
    # [ContextProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ContextProvider.html).
    #
    # To remove the existing context provider instead of replacing it, use `RemoveContextProvider`. Do
    # not specify both `ContextProvider` and `RemoveContextProvider` in the same request.
    property context_provider : ContextProvider | Nil

    # The Amazon Resource Name (ARN) of the IAM Identity Center instance to associate with the OIDC
    # provider.
    #
    # For the format, see
    # [InstanceMetadata](https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_InstanceMetadata.html)
    # in the *IAM Identity Center API Reference*.
    #
    # To disassociate the currently associated instance instead of changing it, use
    # `RemoveIdentityCenterInstance`. Do not specify both `IdentityCenterInstanceArn` and
    # `RemoveIdentityCenterInstance` in the same request.
    property identity_center_instance_arn : String | Nil

    # Specifies whether to remove the existing context provider configuration from the OIDC provider.
    # Set this value to `true` to remove the context provider.
    #
    # This parameter is mutually exclusive with `ContextProvider`. In a single request, specify either
    # a new `ContextProvider` value or `RemoveContextProvider`, but not both.
    property remove_context_provider : Bool | Nil

    # Specifies whether to disassociate the IAM Identity Center instance from the OIDC provider. Set
    # this value to `true` to remove the association.
    #
    # This parameter is mutually exclusive with `IdentityCenterInstanceArn`. In a single request,
    # specify either a new `IdentityCenterInstanceArn` value or `RemoveIdentityCenterInstance`, but
    # not both.
    property remove_identity_center_instance : Bool | Nil

    def initialize(
      @open_id_connect_provider_arn : String,
      @context_provider : ContextProvider | Nil = nil,
      @identity_center_instance_arn : String | Nil = nil,
      @remove_context_provider : Bool | Nil = nil,
      @remove_identity_center_instance : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      if value = @context_provider
        params.concat(value.to_query_params("#{prefix}ContextProvider."))
      end

      if value = @identity_center_instance_arn
        params << {"#{prefix}IdentityCenterInstanceArn", value}
      end

      if value = @remove_context_provider
        params << {"#{prefix}RemoveContextProvider", Core::QueryValue.bool(value)}
      end

      if value = @remove_identity_center_instance
        params << {"#{prefix}RemoveIdentityCenterInstance", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        context_provider: node.xpath_node("*[local-name()='ContextProvider']").try { |n| ContextProvider.from_xml(n) },
        identity_center_instance_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='IdentityCenterInstanceArn']")),
        remove_context_provider: Core::XMLValue.bool(node.xpath_node("*[local-name()='RemoveContextProvider']")),
        remove_identity_center_instance: Core::XMLValue.bool(node.xpath_node("*[local-name()='RemoveIdentityCenterInstance']")),
      )
    end

    def validate! : Nil
      if value = @open_id_connect_provider_arn
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be <= 2048") if value.size > 2048
      end

      if value = @context_provider
        value.validate!
      end

      if value = @identity_center_instance_arn
        raise Core::ValidationError.new("IdentityCenterInstanceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IdentityCenterInstanceArn length must be <= 1224") if value.size > 1224
      end
    end

    def_equals_and_hash(@open_id_connect_provider_arn, @context_provider, @identity_center_instance_arn, @remove_context_provider, @remove_identity_center_instance)
  end
end
