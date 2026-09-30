private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The structures that contain summary information about the specified StackSet.
  class StackSetSummary
    # The name of the StackSet.
    property stack_set_name : String | Nil

    # The ID of the StackSet.
    property stack_set_id : String | Nil

    # A description of the StackSet that you specify when the StackSet is created or updated.
    property description : String | Nil

    # The status of the StackSet.
    property status : StackSetStatus | Nil

    # [Service-managed permissions] Describes whether StackSets automatically deploys to Organizations
    # accounts that are added to a target organizational unit (OU).
    property auto_deployment : AutoDeployment | Nil

    # Describes how the IAM roles required for StackSet operations are created.
    #
    # - With `self-managed` permissions, you must create the administrator and execution roles
    # required to deploy to target accounts. For more information, see [Grant self-managed
    # permissions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html).
    #
    # - With `service-managed` permissions, StackSets automatically creates the IAM roles required to
    # deploy to accounts managed by Organizations. For more information, see [Activate trusted access
    # for StackSets with
    # Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html).
    property permission_model : PermissionModels | Nil

    # Status of the StackSet's actual configuration compared to its expected template and parameter
    # configuration.
    #
    # - `DRIFTED`: One or more of the stack instances belonging to the StackSet differs from the
    # expected template and parameter configuration. A stack instance is considered to have drifted if
    # one or more of the resources in the associated stack have drifted.
    #
    # - `NOT_CHECKED`: CloudFormation hasn't checked the StackSet for drift.
    #
    # - `IN_SYNC`: All the stack instances belonging to the StackSet match the expected template and
    # parameter configuration.
    #
    # - `UNKNOWN`: This value is reserved for future use.
    property drift_status : StackDriftStatus | Nil

    # Most recent time when CloudFormation performed a drift detection operation on the StackSet. This
    # value will be `NULL` for any StackSet that drift detection hasn't yet been performed on.
    property last_drift_check_timestamp : Time | Nil

    # Describes whether StackSets performs non-conflicting operations concurrently and queues
    # conflicting operations.
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

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @auto_deployment
        value.validate!
      end

      if value = @managed_execution
        value.validate!
      end
    end

    def_equals_and_hash(@stack_set_name, @stack_set_id, @description, @status, @auto_deployment, @permission_model, @drift_status, @last_drift_check_timestamp, @managed_execution)
  end
end
