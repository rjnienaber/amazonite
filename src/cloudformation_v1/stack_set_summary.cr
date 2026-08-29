private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSetSummary
    property stack_set_name : String | Nil

    property stack_set_id : String | Nil

    property description : String | Nil

    property status : StackSetStatus | Nil

    property auto_deployment : AutoDeployment | Nil

    property permission_model : PermissionModels | Nil

    property drift_status : StackDriftStatus | Nil

    property last_drift_check_timestamp : Time | Nil

    property managed_execution : ManagedExecution | Nil

    def initialize(
      @stack_set_name : String | Nil = nil,
      @stack_set_id : String | Nil = nil,
      @description : String | Nil = nil,
      @status : StackSetStatus | Nil = nil,
      @auto_deployment : AutoDeployment | Nil = nil,
      @permission_model : PermissionModels | Nil = nil,
      @drift_status : StackDriftStatus | Nil = nil,
      @last_drift_check_timestamp : Time | Nil = nil,
      @managed_execution : ManagedExecution | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set_name
        params << {"#{prefix}StackSetName", value}
      end

      if value = @stack_set_id
        params << {"#{prefix}StackSetId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @auto_deployment
        params.concat(value.to_query_params("#{prefix}AutoDeployment."))
      end

      if value = @permission_model
        params << {"#{prefix}PermissionModel", value.to_json_object_key}
      end

      if value = @drift_status
        params << {"#{prefix}DriftStatus", value.to_json_object_key}
      end

      if value = @last_drift_check_timestamp
        params << {"#{prefix}LastDriftCheckTimestamp", Core::QueryValue.time(value)}
      end

      if value = @managed_execution
        params.concat(value.to_query_params("#{prefix}ManagedExecution."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")),
        stack_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetStatus.from_json_object_key?(n.content) : nil,
        auto_deployment: node.xpath_node("*[local-name()='AutoDeployment']").try { |n| AutoDeployment.from_xml(n) },
        permission_model: (n = node.xpath_node("*[local-name()='PermissionModel']")) ? ACF::PermissionModels.from_json_object_key?(n.content) : nil,
        drift_status: (n = node.xpath_node("*[local-name()='DriftStatus']")) ? ACF::StackDriftStatus.from_json_object_key?(n.content) : nil,
        last_drift_check_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='LastDriftCheckTimestamp']")),
        managed_execution: node.xpath_node("*[local-name()='ManagedExecution']").try { |n| ManagedExecution.from_xml(n) },
      )
    end
  end
end
