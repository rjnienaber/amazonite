private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleWithSAMLRequest
    property role_arn : String

    property principal_arn : String

    property saml_assertion : String

    property policy_arns : Array(PolicyDescriptorType) | Nil

    property policy : String | Nil

    property duration_seconds : Int32 | Nil

    def initialize(
      @role_arn : String,
      @principal_arn : String,
      @saml_assertion : String,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleArn", @role_arn}

      params << {"#{prefix}PrincipalArn", @principal_arn}

      params << {"#{prefix}SAMLAssertion", @saml_assertion}

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleArn']")).not_nil!,
        principal_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PrincipalArn']")).not_nil!,
        saml_assertion: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLAssertion']")).not_nil!,
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
      )
    end
  end
end
