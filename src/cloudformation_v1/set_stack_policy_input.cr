private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for the SetStackPolicy action.
  class SetStackPolicyInput
    # The name or unique stack ID that you want to associate a policy with.
    property stack_name : String

    # Structure that contains the stack policy body. For more information, see [Prevent updates to
    # stack
    # resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
    # in the *CloudFormation User Guide*. You can specify either the `StackPolicyBody` or the
    # `StackPolicyURL` parameter, but not both.
    property stack_policy_body : String | Nil

    # Location of a file that contains the stack policy. The URL must point to a policy (maximum size:
    # 16 KB) located in an Amazon S3 bucket in the same Amazon Web Services Region as the stack. The
    # location for an Amazon S3 bucket must start with `https://`. URLs from S3 static websites are
    # not supported.
    #
    # You can specify either the `StackPolicyBody` or the `StackPolicyURL` parameter, but not both.
    property stack_policy_url : String | Nil

    def initialize(
      @stack_name : String,
      @stack_policy_body : String | Nil = nil,
      @stack_policy_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @stack_policy_body
        params << {"#{prefix}StackPolicyBody", value}
      end

      if value = @stack_policy_url
        params << {"#{prefix}StackPolicyURL", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        stack_policy_body: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyBody']")),
        stack_policy_url: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyURL']")),
      )
    end
  end
end
