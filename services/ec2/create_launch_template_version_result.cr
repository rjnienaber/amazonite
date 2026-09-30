private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLaunchTemplateVersionResult
    # Information about the launch template version.
    property launch_template_version : LaunchTemplateVersion | Nil

    # If the new version of the launch template contains parameters or parameter combinations that are
    # not valid, an error code and an error message are returned for each issue that's found.
    property warning : ValidationWarning | Nil

    def initialize(
      @launch_template_version : LaunchTemplateVersion | Nil = nil,
      @warning : ValidationWarning | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_version
        params.concat(value.to_query_params("#{prefix}LaunchTemplateVersion."))
      end

      if value = @warning
        params.concat(value.to_query_params("#{prefix}Warning."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_version: node.xpath_node("*[local-name()='launchTemplateVersion']").try { |n| LaunchTemplateVersion.from_xml(n) },
        warning: node.xpath_node("*[local-name()='warning']").try { |n| ValidationWarning.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template_version
        value.validate!
      end

      if value = @warning
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_version, @warning)
  end
end
