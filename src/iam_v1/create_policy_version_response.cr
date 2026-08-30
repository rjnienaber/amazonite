module Amazonite::IamV1
  # Contains the response to a successful
  # [CreatePolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicyVersion.html)
  # request.
  class CreatePolicyVersionResponse
    # A structure containing details about the new policy version.
    property policy_version : PolicyVersion | Nil

    def initialize(
      @policy_version : PolicyVersion | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_version
        params.concat(value.to_query_params("#{prefix}PolicyVersion."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_version: node.xpath_node("*[local-name()='PolicyVersion']").try { |n| PolicyVersion.from_xml(n) },
      )
    end
  end
end
