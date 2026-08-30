private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [CreateSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateSAMLProvider.html)
  # request.
  class CreateSAMLProviderResponse
    # The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.
    property saml_provider_arn : String | Nil

    # A list of tags that are attached to the new IAM SAML provider. The returned list of tags is
    # sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @saml_provider_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @saml_provider_arn
        params << {"#{prefix}SAMLProviderArn", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderArn']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@saml_provider_arn, @tags)
  end
end
