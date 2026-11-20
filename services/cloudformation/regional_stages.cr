private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains the progress information for the individual stages of a StackSet operation in a single
  # Region. Currently reports the stack instances deployment stage for the Region.
  class RegionalStages
    # The progress detail for the stack instances deployment stage in this Region.
    property regional_stack_instances_deployment : RegionalStackInstancesDeployment | Nil

    def initialize(
      @regional_stack_instances_deployment : RegionalStackInstancesDeployment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @regional_stack_instances_deployment
        params.concat(value.to_query_params("#{prefix}RegionalStackInstancesDeployment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        regional_stack_instances_deployment: node.xpath_node("*[local-name()='RegionalStackInstancesDeployment']").try { |n| RegionalStackInstancesDeployment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @regional_stack_instances_deployment
        value.validate!
      end
    end

    def_equals_and_hash(@regional_stack_instances_deployment)
  end
end
