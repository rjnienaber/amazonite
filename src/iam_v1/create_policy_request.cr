private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreatePolicyRequest
    property policy_name : String

    property path : String | Nil

    property policy_document : String

    property description : String | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @policy_name : String,
      @policy_document : String,
      @path : String | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyName", @policy_name}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}PolicyDocument", @policy_document}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
