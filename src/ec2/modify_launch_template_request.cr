private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyLaunchTemplateRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If a
    # client token isn't specified, a randomly generated token is used in the request to ensure
    # idempotency.
    #
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    #
    # Constraint: Maximum 128 ASCII characters.
    property client_token : String | Nil

    # The ID of the launch template.
    #
    # You must specify either the launch template ID or the launch template name, but not both.
    property launch_template_id : String | Nil

    # The name of the launch template.
    #
    # You must specify either the launch template ID or the launch template name, but not both.
    property launch_template_name : String | Nil

    # The version number of the launch template to set as the default version.
    property default_version : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @default_version : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @launch_template_id
        params << {"#{prefix}LaunchTemplateId", value}
      end

      if value = @launch_template_name
        params << {"#{prefix}LaunchTemplateName", value}
      end

      if value = @default_version
        params << {"#{prefix}SetDefaultVersion", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")),
        default_version: Core::XMLValue.string(node.xpath_node("*[local-name()='SetDefaultVersion']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end
    end

    def_equals_and_hash(@dry_run, @client_token, @launch_template_id, @launch_template_name, @default_version)
  end
end
