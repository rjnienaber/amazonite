private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch template and overrides.
  class FleetLaunchTemplateConfigRequest
    # The launch template to use. You must specify either the launch template ID or launch template
    # name in the request.
    property launch_template_specification : FleetLaunchTemplateSpecificationRequest | Nil

    # Any parameters that you specify override the same parameters in the launch template.
    #
    # For fleets of type `request` and `maintain`, a maximum of 300 items is allowed across all launch
    # templates.
    property overrides : Array(FleetLaunchTemplateOverridesRequest) | Nil

    def initialize(
      @launch_template_specification : FleetLaunchTemplateSpecificationRequest | Nil = nil,
      @overrides : Array(FleetLaunchTemplateOverridesRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_specification
        params.concat(value.to_query_params("#{prefix}LaunchTemplateSpecification."))
      end

      (@overrides || [] of FleetLaunchTemplateOverridesRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Overrides.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_specification: node.xpath_node("*[local-name()='LaunchTemplateSpecification']").try { |n| FleetLaunchTemplateSpecificationRequest.from_xml(n) },
        overrides: node.xpath_nodes("*[local-name()='Overrides']/*[local-name()='item']").map { |n| FleetLaunchTemplateOverridesRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template_specification
        value.validate!
      end

      if value = @overrides
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@launch_template_specification, @overrides)
  end
end
