private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch template and overrides.
  class LaunchTemplateAndOverridesResponse
    # The launch template.
    property launch_template_specification : FleetLaunchTemplateSpecification | Nil

    # Any parameters that you specify override the same parameters in the launch template.
    property overrides : FleetLaunchTemplateOverrides | Nil

    def initialize(
      @launch_template_specification : FleetLaunchTemplateSpecification | Nil = nil,
      @overrides : FleetLaunchTemplateOverrides | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_specification
        params.concat(value.to_query_params("#{prefix}LaunchTemplateSpecification."))
      end

      if value = @overrides
        params.concat(value.to_query_params("#{prefix}Overrides."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_specification: node.xpath_node("*[local-name()='launchTemplateSpecification']").try { |n| FleetLaunchTemplateSpecification.from_xml(n) },
        overrides: node.xpath_node("*[local-name()='overrides']").try { |n| FleetLaunchTemplateOverrides.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template_specification
        value.validate!
      end

      if value = @overrides
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_specification, @overrides)
  end
end
