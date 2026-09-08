private alias Core = Amazonite::Core

module Amazonite::EC2
  # Request to create a launch template for a Windows fast launch enabled AMI.
  #
  # Note - You can specify either the `LaunchTemplateName` or the `LaunchTemplateId`, but not both.
  class FastLaunchLaunchTemplateSpecificationRequest
    # Specify the ID of the launch template that the AMI should use for Windows fast launch.
    property launch_template_id : String | Nil

    # Specify the name of the launch template that the AMI should use for Windows fast launch.
    property launch_template_name : String | Nil

    # Specify the version of the launch template that the AMI should use for Windows fast launch.
    property version : String

    def initialize(
      @version : String,
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
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

      params << {"#{prefix}Version", @version}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")),
        version: Core::XMLValue.string(node.xpath_node("*[local-name()='Version']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @version)
  end
end
