private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [CreatePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html)
  # request.
  class CreatePolicyResponse
    # A structure containing details about the new policy.
    property policy : Policy | Nil

    def initialize(
      @policy : Policy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy
        params.concat(value.to_query_params("#{prefix}Policy."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy: node.xpath_node("*[local-name()='Policy']").try { |n| Policy.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @policy
        value.validate!
      end
    end

    def_equals_and_hash(@policy)
  end
end
