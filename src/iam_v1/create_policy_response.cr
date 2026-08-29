module Amazonite::IamV1
  class CreatePolicyResponse
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
  end
end
