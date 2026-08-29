private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetPolicyVersionRequest
    # The Amazon Resource Name (ARN) of the managed policy that you want information about.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String

    # Identifies the policy version to retrieve.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters that consists of the lowercase letter 'v' followed by one or two digits, and
    # optionally followed by a period '.' and a string of letters and digits.
    property version_id : String

    def initialize(
      @policy_arn : String,
      @version_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      params << {"#{prefix}VersionId", @version_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")).not_nil!,
      )
    end
  end
end
