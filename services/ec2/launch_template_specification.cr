private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the launch template to use.
  class LaunchTemplateSpecification
    # The ID of the launch template.
    #
    # You must specify either the launch template ID or the launch template name, but not both.
    property launch_template_id : String | Nil

    # The name of the launch template.
    #
    # You must specify either the launch template ID or the launch template name, but not both.
    property launch_template_name : String | Nil

    # The launch template version number, `$Latest`, or `$Default`.
    #
    # A value of `$Latest` uses the latest version of the launch template.
    #
    # A value of `$Default` uses the default version of the launch template.
    #
    # Default: The default version of the launch template.
    property version : String | Nil

    def initialize(
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @version : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_id
        params << {"#{prefix}LaunchTemplateId", value}
      end

      if value = @launch_template_name
        params << {"#{prefix}LaunchTemplateName", value}
      end

      if value = @version
        params << {"#{prefix}Version", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")),
        version: Core::XMLValue.string(node.xpath_node("*[local-name()='Version']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @version)
  end
end
