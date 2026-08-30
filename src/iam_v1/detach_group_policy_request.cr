private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DetachGroupPolicyRequest
    # The name (friendly name, not ARN) of the IAM group to detach the policy from.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property group_name : String

    # The Amazon Resource Name (ARN) of the IAM policy you want to detach.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String

    def initialize(
      @group_name : String,
      @policy_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}PolicyArn", @policy_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
      )
    end

    def_equals_and_hash(@group_name, @policy_arn)
  end
end
