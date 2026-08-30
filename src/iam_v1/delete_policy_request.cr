private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeletePolicyRequest
    # The Amazon Resource Name (ARN) of the IAM policy you want to delete.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String

    def initialize(
      @policy_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
      )
    end

    def_equals_and_hash(@policy_arn)
  end
end
