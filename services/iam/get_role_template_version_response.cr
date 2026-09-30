private alias Core = Amazonite::Core

module Amazonite::Iam
  class GetRoleTemplateVersionResponse
    # A structure that contains details about the requested role template version.
    property role_template_version : RoleTemplateVersion

    def initialize(
      @role_template_version : RoleTemplateVersion,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@role_template_version.to_query_params("#{prefix}RoleTemplateVersion."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_template_version: node.xpath_node("*[local-name()='RoleTemplateVersion']").try { |n| RoleTemplateVersion.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @role_template_version
        value.validate!
      end
    end

    def_equals_and_hash(@role_template_version)
  end
end
