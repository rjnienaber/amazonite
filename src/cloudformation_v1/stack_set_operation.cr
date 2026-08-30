private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The structure that contains information about a StackSet operation.
  class StackSetOperation
    # The unique ID of a StackSet operation.
    property operation_id : String | Nil

    # The ID of the StackSet.
    property stack_set_id : String | Nil

    # The type of StackSet operation: `CREATE`, `UPDATE`, or `DELETE`. Create and delete operations
    # affect only the specified stack instances that are associated with the specified StackSet.
    # Update operations affect both the StackSet itself, in addition to *all* associated stack
    # instances.
    property action : StackSetOperationAction | Nil

    # The status of the operation.
    #
    # - `FAILED`: The operation exceeded the specified failure tolerance. The failure tolerance value
    # that you've set for an operation is applied for each Region during stack create and update
    # operations. If the number of failed stacks within a Region exceeds the failure tolerance, the
    # status of the operation in the Region is set to `FAILED`. This in turn sets the status of the
    # operation as a whole to `FAILED`, and CloudFormation cancels the operation in any remaining
    # Regions.
    #
    # - `QUEUED`: [Service-managed permissions] For automatic deployments that require a sequence of
    # operations, the operation is queued to be performed. For more information, see the [StackSets
    # status
    # codes](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes)
    # in the *CloudFormation User Guide*.
    #
    # - `RUNNING`: The operation is currently being performed.
    #
    # - `STOPPED`: The user has canceled the operation.
    #
    # - `STOPPING`: The operation is in the process of stopping, at user request.
    #
    # - `SUCCEEDED`: The operation completed creating or updating all the specified stacks without
    # exceeding the failure tolerance for the operation.
    property status : StackSetOperationStatus | Nil

    # The preferences for how CloudFormation performs this StackSet operation.
    property operation_preferences : StackSetOperationPreferences | Nil

    # For StackSet operations of action type `DELETE`, specifies whether to remove the stack instances
    # from the specified StackSet, but doesn't delete the stacks. You can't re-associate a retained
    # stack, or add an existing, saved stack to a new StackSet.
    property retain_stacks : Bool | Nil

    # The Amazon Resource Name (ARN) of the IAM role used to perform this StackSet operation.
    #
    # Use customized administrator roles to control which users or groups can manage specific
    # StackSets within the same administrator account. For more information, see [Grant self-managed
    # permissions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html)
    # in the *CloudFormation User Guide*.
    property administration_role_arn : String | Nil

    # The name of the IAM execution role used to create or update the StackSet.
    #
    # Use customized execution roles to control which stack resources users and groups can include in
    # their StackSets.
    property execution_role_name : String | Nil

    # The time at which the operation was initiated. Note that the creation times for the stack set
    # operation might differ from the creation time of the individual stacks themselves. This is
    # because CloudFormation needs to perform preparatory work for the operation, such as dispatching
    # the work to the requested Regions, before actually creating the first stacks.
    property creation_timestamp : Time | Nil

    # The time at which the StackSet operation ended, across all accounts and Regions specified. Note
    # that this doesn't necessarily mean that the StackSet operation was successful, or even
    # attempted, in each account or Region.
    property end_timestamp : Time | Nil

    # The Organizations accounts affected by the stack operation. Valid only if the StackSet uses
    # service-managed permissions.
    property deployment_targets : DeploymentTargets | Nil

    # Detailed information about the drift status of the StackSet. This includes information about
    # drift operations currently being performed on the StackSet.
    #
    # This information will only be present for StackSet operations whose `Action` type is
    # `DETECT_DRIFT`.
    #
    # For more information, see [Performing drift detection on CloudFormation
    # StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html)
    # in the *CloudFormation User Guide*.
    property stack_set_drift_detection_details : StackSetDriftDetectionDetails | Nil

    # The status of the operation in details.
    property status_reason : String | Nil

    # Detailed information about the StackSet operation.
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
