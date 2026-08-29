private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSetOperation
    property operation_id : String | Nil

    property stack_set_id : String | Nil

    property action : StackSetOperationAction | Nil

    property status : StackSetOperationStatus | Nil

    property operation_preferences : StackSetOperationPreferences | Nil

    property retain_stacks : Bool | Nil

    property administration_role_arn : String | Nil

    property execution_role_name : String | Nil

    property creation_timestamp : Time | Nil

    property end_timestamp : Time | Nil

    property deployment_targets : DeploymentTargets | Nil

    property stack_set_drift_detection_details : StackSetDriftDetectionDetails | Nil

    property status_reason : String | Nil

    property status_details : StackSetOperationStatusDetails | Nil

    def initialize(
      @operation_id : String | Nil = nil,
      @stack_set_id : String | Nil = nil,
      @action : StackSetOperationAction | Nil = nil,
      @status : StackSetOperationStatus | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
      @retain_stacks : Bool | Nil = nil,
      @administration_role_arn : String | Nil = nil,
      @execution_role_name : String | Nil = nil,
      @creation_timestamp : Time | Nil = nil,
      @end_timestamp : Time | Nil = nil,
      @deployment_targets : DeploymentTargets | Nil = nil,
      @stack_set_drift_detection_details : StackSetDriftDetectionDetails | Nil = nil,
      @status_reason : String | Nil = nil,
      @status_details : StackSetOperationStatusDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      if value = @stack_set_id
        params << {"#{prefix}StackSetId", value}
      end

      if value = @action
        params << {"#{prefix}Action", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end

      if value = @retain_stacks
        params << {"#{prefix}RetainStacks", Core::QueryValue.bool(value)}
      end

      if value = @administration_role_arn
        params << {"#{prefix}AdministrationRoleARN", value}
      end

      if value = @execution_role_name
        params << {"#{prefix}ExecutionRoleName", value}
      end

      if value = @creation_timestamp
        params << {"#{prefix}CreationTimestamp", Core::QueryValue.time(value)}
      end

      if value = @end_timestamp
        params << {"#{prefix}EndTimestamp", Core::QueryValue.time(value)}
      end

      if value = @deployment_targets
        params.concat(value.to_query_params("#{prefix}DeploymentTargets."))
      end

      if value = @stack_set_drift_detection_details
        params.concat(value.to_query_params("#{prefix}StackSetDriftDetectionDetails."))
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @status_details
        params.concat(value.to_query_params("#{prefix}StatusDetails."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        stack_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetId']")),
        action: (n = node.xpath_node("*[local-name()='Action']")) ? ACF::StackSetOperationAction.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetOperationStatus.from_json_object_key?(n.content) : nil,
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        retain_stacks: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainStacks']")),
        administration_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='AdministrationRoleARN']")),
        execution_role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleName']")),
        creation_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTimestamp']")),
        end_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTimestamp']")),
        deployment_targets: node.xpath_node("*[local-name()='DeploymentTargets']").try { |n| DeploymentTargets.from_xml(n) },
        stack_set_drift_detection_details: node.xpath_node("*[local-name()='StackSetDriftDetectionDetails']").try { |n| StackSetDriftDetectionDetails.from_xml(n) },
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        status_details: node.xpath_node("*[local-name()='StatusDetails']").try { |n| StackSetOperationStatusDetails.from_xml(n) },
      )
    end
  end
end
