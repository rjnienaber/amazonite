private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DelegationPermission
    property policy_template_arn : String | Nil

    property parameters : Array(PolicyParameter) | Nil

    def initialize(
      @policy_template_arn : String | Nil = nil,
      @parameters : Array(PolicyParameter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_template_arn
        params << {"#{prefix}PolicyTemplateArn", value}
      end

      (@parameters || [] of PolicyParameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_template_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyTemplateArn']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| PolicyParameter.from_xml(n) },
      )
    end
  end
end
