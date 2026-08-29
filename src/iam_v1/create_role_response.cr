module Amazonite::IamV1
  class CreateRoleResponse
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
