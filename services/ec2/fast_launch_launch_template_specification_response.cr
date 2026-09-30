private alias Core = Amazonite::Core

module Amazonite::EC2
  # Identifies the launch template that the AMI uses for Windows fast launch.
  class FastLaunchLaunchTemplateSpecificationResponse
    # The ID of the launch template that the AMI uses for Windows fast launch.
    property launch_template_id : String | Nil

    # The name of the launch template that the AMI uses for Windows fast launch.
    property launch_template_name : String | Nil

    # The version of the launch template that the AMI uses for Windows fast launch.
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
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='launchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='launchTemplateName']")),
        version: Core::XMLValue.string(node.xpath_node("*[local-name()='version']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @version)
  end
end
