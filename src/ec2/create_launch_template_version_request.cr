private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLaunchTemplateVersionRequest
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

    # The version of the launch template on which to base the new version. Snapshots applied to the
    # block device mapping are ignored when creating a new version unless they are explicitly
    # included.
    #
    # If you specify this parameter, the new version inherits the launch parameters from the source
    # version. If you specify additional launch parameters for the new version, they overwrite any
    # corresponding launch parameters inherited from the source version.
    #
    # If you omit this parameter, the new version contains only the launch parameters that you specify
    # for the new version.
    property source_version : String | Nil

    # A description for the version of the launch template.
    property version_description : String | Nil

    # The information for the launch template.
    property launch_template_data : RequestLaunchTemplateData

    # If `true`, and if a Systems Manager parameter is specified for `ImageId`, the AMI ID is
    # displayed in the response for `imageID`. For more information, see [Use a Systems Manager
    # parameter instead of an AMI
    # ID](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#use-an-ssm-parameter-instead-of-an-ami-id)
    # in the *Amazon EC2 User Guide*.
    #
    # Default: `false`
    property resolve_alias : Bool | Nil

    def initialize(
      @launch_template_data : RequestLaunchTemplateData,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @source_version : String | Nil = nil,
      @version_description : String | Nil = nil,
      @resolve_alias : Bool | Nil = nil,
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

      if value = @source_version
        params << {"#{prefix}SourceVersion", value}
      end

      if value = @version_description
        params << {"#{prefix}VersionDescription", value}
      end

      params.concat(@launch_template_data.to_query_params("#{prefix}LaunchTemplateData."))

      if value = @resolve_alias
        params << {"#{prefix}ResolveAlias", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")),
        source_version: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceVersion']")),
        version_description: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionDescription']")),
        launch_template_data: node.xpath_node("*[local-name()='LaunchTemplateData']").try { |n| RequestLaunchTemplateData.from_xml(n) }.not_nil!,
        resolve_alias: Core::XMLValue.bool(node.xpath_node("*[local-name()='ResolveAlias']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end

      if value = @version_description
        raise Core::ValidationError.new("VersionDescription length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("VersionDescription length must be <= 255") if value.size > 255
      end

      if value = @launch_template_data
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @client_token, @launch_template_id, @launch_template_name, @source_version, @version_description, @launch_template_data, @resolve_alias)
  end
end
