private alias Core = Amazonite::Core

module Amazonite::IamV1
  class TagOpenIDConnectProviderRequest
    # The ARN of the OIDC identity provider in IAM to which you want to add tags.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property open_id_connect_provider_arn : String

    # The list of tags that you want to attach to the OIDC identity provider in IAM. Each tag consists
    # of a key name and an associated value.
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @open_id_connect_provider_arn : String,
      @tags : Array(Tag),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      @tags.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@open_id_connect_provider_arn, @tags)
  end
end
