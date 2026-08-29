module Amazonite::IamV1
  class GetAccountPasswordPolicyResponse
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
  end
end
