private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The structure that contains summary information about a stack instance.
  class StackInstanceSummary
    # The name or unique ID of the StackSet that the stack instance is associated with.
    property stack_set_id : String | Nil

    # The name of the Amazon Web Services Region that the stack instance is associated with.
    property region : String | Nil

    # [Self-managed permissions] The name of the Amazon Web Services account that the stack instance
    # is associated with.
    property account : String | Nil

    # The ID of the stack instance.
    property stack_id : String | Nil

    # The status of the stack instance, in terms of its synchronization with its associated stack set.
    #
    # - `INOPERABLE`: A `DeleteStackInstances` operation has failed and left the stack in an unstable
    # state. Stacks in this state are excluded from further `UpdateStackSet` operations. You might
    # need to perform a `DeleteStackInstances` operation, with `RetainStacks` set to `true`, to delete
    # the stack instance, and then delete the stack manually. `INOPERABLE` can be returned here when
    # the cause is a failed import. If it's due to a failed import, the operation can be retried once
    # the failures are fixed. To see if this is due to a failed import, call the DescribeStackInstance
    # API operation, look at the `DetailedStatus` member returned in the `StackInstanceSummary`
    # member.
    #
    # - `OUTDATED`: The stack isn't currently up to date with the StackSet because:
    #
    # - The associated stack failed during a `CreateStackSet` or `UpdateStackSet` operation.
    #
    # - The stack was part of a `CreateStackSet` or `UpdateStackSet` operation that failed or was
    # stopped before the stack was created or updated.
    #
    # - `CURRENT`: The stack is currently up to date with the StackSet.
    property status : StackInstanceStatus | Nil

    # The explanation for the specific status code assigned to this stack instance.
    property status_reason : String | Nil

    # The detailed status of the stack instance.
    property stack_instance_status : StackInstanceComprehensiveStatus | Nil

    # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
    # specified for
    # [DeploymentTargets](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html).
    property organizational_unit_id : String | Nil

    # Status of the stack instance's actual configuration compared to the expected template and
    # parameter configuration of the StackSet it belongs to.
    #
    # - `DRIFTED`: The stack differs from the expected template and parameter configuration of the
    # StackSet it belongs to. A stack instance is considered to have drifted if one or more of the
    # resources in the associated stack have drifted.
    #
    # - `NOT_CHECKED`: CloudFormation hasn't checked if the stack instance differs from its expected
    # StackSet configuration.
    #
    # - `IN_SYNC`: The stack instance's actual configuration matches its expected StackSet
    # configuration.
    #
    # - `UNKNOWN`: This value is reserved for future use.
    property drift_status : StackDriftStatus | Nil

    # Most recent time when CloudFormation performed a drift detection operation on the stack
    # instance. This value will be `NULL` for any stack instance that drift detection hasn't yet been
    # performed on.
    property last_drift_check_timestamp : Time | Nil

    # The last unique ID of a StackSet operation performed on a stack instance.
    property last_operation_id : String | Nil

    def initialize(
      @stack_set_id : String | Nil = nil,
      @region : String | Nil = nil,
      @account : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @status : StackInstanceStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @stack_instance_status : StackInstanceComprehensiveStatus | Nil = nil,
      @organizational_unit_id : String | Nil = nil,
      @drift_status : StackDriftStatus | Nil = nil,
      @last_drift_check_timestamp : Time | Nil = nil,
      @last_operation_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set_id
        params << {"#{prefix}StackSetId", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @account
        params << {"#{prefix}Account", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @stack_instance_status
        params.concat(value.to_query_params("#{prefix}StackInstanceStatus."))
      end

      if value = @organizational_unit_id
        params << {"#{prefix}OrganizationalUnitId", value}
      end

      if value = @drift_status
        params << {"#{prefix}DriftStatus", value.to_json_object_key}
      end

      if value = @last_drift_check_timestamp
        params << {"#{prefix}LastDriftCheckTimestamp", Core::QueryValue.time(value)}
      end

      if value = @last_operation_id
        params << {"#{prefix}LastOperationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetId']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackInstanceStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        stack_instance_status: node.xpath_node("*[local-name()='StackInstanceStatus']").try { |n| StackInstanceComprehensiveStatus.from_xml(n) },
        organizational_unit_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationalUnitId']")),
        drift_status: (n = node.xpath_node("*[local-name()='DriftStatus']")) ? ACF::StackDriftStatus.from_json_object_key?(n.content) : nil,
        last_drift_check_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='LastDriftCheckTimestamp']")),
        last_operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LastOperationId']")),
      )
    end

    def validate! : Nil
      if value = @region
        raise Core::ValidationError.new("Region does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-]{1,128}$"))
      end

      if value = @account
        raise Core::ValidationError.new("Account does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @stack_instance_status
        value.validate!
      end

      if value = @organizational_unit_id
        raise Core::ValidationError.new("OrganizationalUnitId does not match the required pattern") unless value.matches?(Regex.new("^(ou-[a-z0-9]{4,32}-[a-z0-9]{8,32}|r-[a-z0-9]{4,32})$"))
      end

      if value = @last_operation_id
        raise Core::ValidationError.new("LastOperationId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LastOperationId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LastOperationId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end
    end

    def_equals_and_hash(@stack_set_id, @region, @account, @stack_id, @status, @status_reason, @stack_instance_status, @organizational_unit_id, @drift_status, @last_drift_check_timestamp, @last_operation_id)
  end
end
