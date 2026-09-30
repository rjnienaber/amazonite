private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Amazon EC2 launch template that can be used by a Spot Fleet to configure Amazon EC2
  # instances. You must specify either the ID or name of the launch template in the request, but not
  # both.
  #
  # For information about launch templates, see [Launch an instance from a launch
  # template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html) in the
  # *Amazon EC2 User Guide*.
  class FleetLaunchTemplateSpecification
    # The ID of the launch template.
    #
    # You must specify the `LaunchTemplateId` or the `LaunchTemplateName`, but not both.
    property launch_template_id : String | Nil

    # The name of the launch template.
    #
    # You must specify the `LaunchTemplateName` or the `LaunchTemplateId`, but not both.
    property launch_template_name : String | Nil

    # The launch template version number, `$Latest`, or `$Default`. You must specify a value,
    # otherwise the request fails.
    #
    # If the value is `$Latest`, Amazon EC2 uses the latest version of the launch template.
    #
    # If the value is `$Default`, Amazon EC2 uses the default version of the launch template.
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
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @version)
  end
end
