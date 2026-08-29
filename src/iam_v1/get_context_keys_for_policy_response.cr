module Amazonite::IamV1
  class GetContextKeysForPolicyResponse
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
  end
end
