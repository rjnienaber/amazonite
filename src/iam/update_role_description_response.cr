private alias Core = Amazonite::Core

module Amazonite::Iam
  class UpdateRoleDescriptionResponse
    # A structure that contains details about the modified role.
    property role : Role | Nil

    def initialize(
      @role : Role | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @role
        params.concat(value.to_query_params("#{prefix}Role."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role: node.xpath_node("*[local-name()='Role']").try { |n| Role.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @role
        value.validate!
      end
    end

    def_equals_and_hash(@role)
  end
end
