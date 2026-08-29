private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [GetRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRolePolicy.html)
  # request.
  class GetRolePolicyResponse
    # The role the policy is associated with.
    property role_name : String

    # The name of the policy.
    property policy_name : String

    # The policy document.
    #
    # IAM stores policies in JSON format. However, resources that were created using CloudFormation
    # templates can be formatted in YAML. CloudFormation always converts a YAML policy to JSON format
    # before submitting it to IAM.
    property policy_document : String

    def initialize(
      @role_name : String,
      @policy_name : String,
      @policy_document : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}PolicyName", @policy_name}

      params << {"#{prefix}PolicyDocument", @policy_document}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
      )
    end
  end
end
