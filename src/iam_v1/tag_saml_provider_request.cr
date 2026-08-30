private alias Core = Amazonite::Core

module Amazonite::IamV1
  class TagSAMLProviderRequest
    # The ARN of the SAML identity provider in IAM to which you want to add tags.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property saml_provider_arn : String

    # The list of tags that you want to attach to the SAML identity provider in IAM. Each tag consists
    # of a key name and an associated value.
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @saml_provider_arn : String,
      @tags : Array(Tag),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SAMLProviderArn", @saml_provider_arn}

      @tags.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderArn']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @saml_provider_arn
        raise Core::ValidationError.new("SAMLProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("SAMLProviderArn length must be <= 2048") if value.size > 2048
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@saml_provider_arn, @tags)
  end
end
