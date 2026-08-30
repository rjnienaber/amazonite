private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [GetAccountPasswordPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountPasswordPolicy.html)
  # request.
  class GetAccountPasswordPolicyResponse
    # A structure that contains details about the account's password policy.
    property password_policy : PasswordPolicy

    def initialize(
      @password_policy : PasswordPolicy,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@password_policy.to_query_params("#{prefix}PasswordPolicy."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        password_policy: node.xpath_node("*[local-name()='PasswordPolicy']").try { |n| PasswordPolicy.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @password_policy
        value.validate!
      end
    end

    def_equals_and_hash(@password_policy)
  end
end
