private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLaunchTemplateVersionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the launch template.
    #
    # You must specify either the launch template ID or the launch template name, but not both.
    property launch_template_id : String | Nil

    # The name of the launch template.
    #
    # You must specify either the launch template ID or the launch template name, but not both.
    property launch_template_name : String | Nil

    # The version numbers of one or more launch template versions to delete. You can specify up to 200
    # launch template version numbers.
    property versions : Array(String) = [] of String

    def initialize(
      @versions : Array(String),
      @dry_run : Bool | Nil = nil,
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @launch_template_id
        params << {"#{prefix}LaunchTemplateId", value}
      end

      if value = @launch_template_name
        params << {"#{prefix}LaunchTemplateName", value}
      end

      @versions.each_with_index(1) do |item, i|
        params << {"#{prefix}LaunchTemplateVersion.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")),
        versions: node.xpath_nodes("*[local-name()='LaunchTemplateVersion']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end
    end

    def_equals_and_hash(@dry_run, @launch_template_id, @launch_template_name, @versions)
  end
end
