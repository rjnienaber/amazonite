private alias Core = Amazonite::Core

module Amazonite::Iam
  class UpdateRoleDescriptionRequest
    # The name of the role that you want to modify.
    property role_name : String

    # The new description that you want to apply to the specified role.
    property description : String

    def initialize(
      @role_name : String,
      @description : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}Description", @description}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end
    end

    def_equals_and_hash(@role_name, @description)
  end
end
