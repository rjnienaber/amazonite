private alias Core = Amazonite::Core

module Amazonite::Iam
  class UntagOpenIDConnectProviderRequest
    # The ARN of the OIDC provider in IAM from which you want to remove tags.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property open_id_connect_provider_arn : String

    # A list of key names as a simple array of strings. The tags with matching keys are removed from
    # the specified OIDC provider.
    property tag_keys : Array(String) = [] of String

    def initialize(
      @open_id_connect_provider_arn : String,
      @tag_keys : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      @tag_keys.each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeys.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        tag_keys: node.xpath_nodes("*[local-name()='TagKeys']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @open_id_connect_provider_arn
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be <= 2048") if value.size > 2048
      end

      if value = @tag_keys
        raise Core::ValidationError.new("TagKeys must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TagKeys must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@open_id_connect_provider_arn, @tag_keys)
  end
end
