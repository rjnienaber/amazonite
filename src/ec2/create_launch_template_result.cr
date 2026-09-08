private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLaunchTemplateResult
    # Information about the launch template.
    property launch_template : LaunchTemplate | Nil

    # If the launch template contains parameters or parameter combinations that are not valid, an
    # error code and an error message are returned for each issue that's found.
    property warning : ValidationWarning | Nil

    def initialize(
      @launch_template : LaunchTemplate | Nil = nil,
      @warning : ValidationWarning | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template
        params.concat(value.to_query_params("#{prefix}LaunchTemplate."))
      end

      if value = @warning
        params.concat(value.to_query_params("#{prefix}Warning."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template: node.xpath_node("*[local-name()='launchTemplate']").try { |n| LaunchTemplate.from_xml(n) },
        warning: node.xpath_node("*[local-name()='warning']").try { |n| ValidationWarning.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template
        value.validate!
      end

      if value = @warning
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template, @warning)
  end
end
