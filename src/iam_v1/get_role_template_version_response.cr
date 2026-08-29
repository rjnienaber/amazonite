module Amazonite::IamV1
  class GetRoleTemplateVersionResponse
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
  end
end
