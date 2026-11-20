private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains detailed progress information for the individual stages of a StackSet operation: the
  # role provisioning stage and the stack instances deployment stage.
  class Stages
    # The progress detail for the role provisioning stage. For operations that do not provision roles,
    # this stage is present with a `Status` of `NOT_APPLICABLE`.
    property role_provisioning : RoleProvisioning | Nil

    # The progress detail for the stack instances deployment stage. This stage reports the deployment
    # of stack instances to the target accounts and Amazon Web Services Regions, after any role
    # provisioning has finished.
    property stack_instances_deployment : StackInstancesDeployment | Nil

    def initialize(
      @role_provisioning : RoleProvisioning | Nil = nil,
      @stack_instances_deployment : StackInstancesDeployment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @role_provisioning
        params.concat(value.to_query_params("#{prefix}RoleProvisioning."))
      end

      if value = @stack_instances_deployment
        params.concat(value.to_query_params("#{prefix}StackInstancesDeployment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_provisioning: node.xpath_node("*[local-name()='RoleProvisioning']").try { |n| RoleProvisioning.from_xml(n) },
        stack_instances_deployment: node.xpath_node("*[local-name()='StackInstancesDeployment']").try { |n| StackInstancesDeployment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @role_provisioning
        value.validate!
      end

      if value = @stack_instances_deployment
        value.validate!
      end
    end

    def_equals_and_hash(@role_provisioning, @stack_instances_deployment)
  end
end
