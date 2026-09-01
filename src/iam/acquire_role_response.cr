private alias Core = Amazonite::Core

module Amazonite::Iam
  class AcquireRoleResponse
    # A structure that contains details about the IAM role that was created.
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

    def validate! : Nil
      if value = @role
        value.validate!
      end
    end

    def_equals_and_hash(@role)
  end
end
