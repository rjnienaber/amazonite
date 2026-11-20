private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [GetOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html)
  # request.
  class GetOpenIDConnectProviderResponse
    # The URL that the IAM OIDC provider resource object is associated with. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property url : String | Nil

    # A list of client IDs (also known as audiences) that are associated with the specified IAM OIDC
    # provider resource object. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property client_id_list : Array(String) | Nil

    # A list of certificate thumbprints that are associated with the specified IAM OIDC provider
    # resource object. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property thumbprint_list : Array(String) | Nil

    # The date and time when the IAM OIDC provider resource object was created in the Amazon Web
    # Services account.
    property create_date : Time | Nil

    # A list of tags that are attached to the specified IAM OIDC provider. The returned list of tags
    # is sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    property tags : Array(Tag) | Nil

    # The trusted identity propagation context provider configuration associated with the IAM OIDC
    # provider resource object. For more information, see
    # [ContextProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ContextProvider.html).
    #
    # This element is returned only when a trusted identity propagation context provider is configured
    # for the OIDC provider.
    property context_provider : ContextProvider | Nil

    # The Amazon Resource Name (ARN) of the IAM Identity Center instance associated with the IAM OIDC
    # provider resource object.
    #
    # For the format, see
    # [InstanceMetadata](https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_InstanceMetadata.html)
    # in the *IAM Identity Center API Reference*.
    #
    # This element is returned only when an IAM Identity Center instance is associated with the OIDC
    # provider.
    property identity_center_instance_arn : String | Nil

    # The Amazon Resource Name (ARN) of the identity store that is resolved from the associated IAM
    # Identity Center instance.
    #
    # For the format, see
    # [InstanceMetadata](https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_InstanceMetadata.html)
    # in the *IAM Identity Center API Reference*.
    #
    # This element is returned only when an IAM Identity Center instance is associated with the OIDC
    # provider.
    property identity_store_arn : String | Nil

    def initialize(
      @url : String | Nil = nil,
      @client_id_list : Array(String) | Nil = nil,
      @thumbprint_list : Array(String) | Nil = nil,
      @create_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @context_provider : ContextProvider | Nil = nil,
      @identity_center_instance_arn : String | Nil = nil,
      @identity_store_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @url
        params << {"#{prefix}Url", value}
      end

      (@client_id_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ClientIDList.member.#{i}", item}
      end

      (@thumbprint_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ThumbprintList.member.#{i}", item}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @context_provider
        params.concat(value.to_query_params("#{prefix}ContextProvider."))
      end

      if value = @identity_center_instance_arn
        params << {"#{prefix}IdentityCenterInstanceArn", value}
      end

      if value = @identity_store_arn
        params << {"#{prefix}IdentityStoreArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")),
        client_id_list: node.xpath_nodes("*[local-name()='ClientIDList']/*[local-name()='member']").map { |n| n.content },
        thumbprint_list: node.xpath_nodes("*[local-name()='ThumbprintList']/*[local-name()='member']").map { |n| n.content },
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        context_provider: node.xpath_node("*[local-name()='ContextProvider']").try { |n| ContextProvider.from_xml(n) },
        identity_center_instance_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='IdentityCenterInstanceArn']")),
        identity_store_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='IdentityStoreArn']")),
      )
    end

    def validate! : Nil
      if value = @url
        raise Core::ValidationError.new("Url length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Url length must be <= 255") if value.size > 255
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @context_provider
        value.validate!
      end

      if value = @identity_center_instance_arn
        raise Core::ValidationError.new("IdentityCenterInstanceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IdentityCenterInstanceArn length must be <= 1224") if value.size > 1224
      end

      if value = @identity_store_arn
        raise Core::ValidationError.new("IdentityStoreArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("IdentityStoreArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@url, @client_id_list, @thumbprint_list, @create_date, @tags, @context_provider, @identity_center_instance_arn, @identity_store_arn)
  end
end
