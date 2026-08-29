private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ContextEntry
    property context_key_name : String | Nil

    property context_key_values : Array(String) | Nil

    property context_key_type : ContextKeyTypeEnum | Nil

    def initialize(
      @context_key_name : String | Nil = nil,
      @context_key_values : Array(String) | Nil = nil,
      @context_key_type : ContextKeyTypeEnum | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @context_key_name
        params << {"#{prefix}ContextKeyName", value}
      end

      (@context_key_values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ContextKeyValues.member.#{i}", item}
      end

      if value = @context_key_type
        params << {"#{prefix}ContextKeyType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        context_key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ContextKeyName']")),
        context_key_values: node.xpath_nodes("*[local-name()='ContextKeyValues']/*[local-name()='member']").map { |n| n.content },
        context_key_type: (n = node.xpath_node("*[local-name()='ContextKeyType']")) ? AI::ContextKeyTypeEnum.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
