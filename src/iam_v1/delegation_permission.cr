private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the permissions being delegated in a delegation request.
  class DelegationPermission
    # This ARN maps to a pre-registered policy content for this partner. See the [partner onboarding
    # documentation]() to understand how to create a delegation template.
    property policy_template_arn : String | Nil

    # A list of policy parameters that define the scope and constraints of the delegated permissions.
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

    def_equals_and_hash(@policy_template_arn, @parameters)
  end
end
