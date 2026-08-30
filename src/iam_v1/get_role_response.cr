module Amazonite::IamV1
  # Contains the response to a successful
  # [GetRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html) request.
  class GetRoleResponse
    # A structure containing details about the IAM role.
    property role : Role

    def initialize(
      @role : Role,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@role.to_query_params("#{prefix}Role."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role: node.xpath_node("*[local-name()='Role']").try { |n| Role.from_xml(n) }.not_nil!,
      )
    end
  end
end
