module Amazonite::Iam
  # Contains the response to a successful
  # [GetContextKeysForPrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html)
  # or
  # [GetContextKeysForCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html)
  # request.
  class GetContextKeysForPolicyResponse
    # The list of context keys that are referenced in the input policies.
    property context_key_names : Array(String) | Nil

    def initialize(
      @context_key_names : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@context_key_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ContextKeyNames.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        context_key_names: node.xpath_nodes("*[local-name()='ContextKeyNames']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@context_key_names)
  end
end
