private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html)
  # request.
  class CreateOpenIDConnectProviderResponse
    # The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that is created. For more
    # information, see
    # [OpenIDConnectProviderListEntry](https://docs.aws.amazon.com/IAM/latest/APIReference/API_OpenIDConnectProviderListEntry.html).
    property open_id_connect_provider_arn : String | Nil

    # A list of tags that are attached to the new IAM OIDC provider. The returned list of tags is
    # sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @open_id_connect_provider_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @open_id_connect_provider_arn
        params << {"#{prefix}OpenIDConnectProviderArn", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
