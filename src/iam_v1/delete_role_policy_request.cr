private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteRolePolicyRequest
    # The name (friendly name, not ARN) identifying the role that the policy is embedded in.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property role_name : String

    # The name of the inline policy to delete from the specified IAM role.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property policy_name : String

    def initialize(
      @role_name : String,
      @policy_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}PolicyName", @policy_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
      )
    end

    def_equals_and_hash(@role_name, @policy_name)
  end
end
