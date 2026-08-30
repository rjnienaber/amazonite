private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The structures that contain summary information about the specified operation.
  class StackSetOperationSummary
    # The unique ID of the StackSet operation.
    property operation_id : String | Nil

    # The type of operation: `CREATE`, `UPDATE`, or `DELETE`. Create and delete operations affect only
    # the specified stack instances that are associated with the specified StackSet. Update operations
    # affect both the StackSet itself and *all* associated StackSet instances.
    property action : StackSetOperationAction | Nil

    # The overall status of the operation.
    #
    # - `FAILED`: The operation exceeded the specified failure tolerance. The failure tolerance value
    # that you've set for an operation is applied for each Region during stack create and update
    # operations. If the number of failed stacks within a Region exceeds the failure tolerance, the
    # status of the operation in the Region is set to `FAILED`. This in turn sets the status of the
    # operation as a whole to `FAILED`, and CloudFormation cancels the operation in any remaining
    # Regions.
    #
    # - `QUEUED`: [Service-managed permissions] For automatic deployments that require a sequence of
    # operations, the operation is queued to be performed. For more information, see the [StackSet
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

    # The time at which the operation was initiated. Note that the creation times for the StackSet
    # operation might differ from the creation time of the individual stacks themselves. This is
    # because CloudFormation needs to perform preparatory work for the operation, such as dispatching
    # the work to the requested Regions, before actually creating the first stacks.
    property creation_timestamp : Time | Nil

    # The time at which the StackSet operation ended, across all accounts and Regions specified. Note
    # that this doesn't necessarily mean that the StackSet operation was successful, or even
    # attempted, in each account or Region.
    property end_timestamp : Time | Nil

    # The status of the operation in details.
    property status_reason : String | Nil

    # Detailed information about the StackSet operation.
    property status_details : StackSetOperationStatusDetails | Nil

    # The user-specified preferences for how CloudFormation performs a StackSet operation.
    #
    # For more information about maximum concurrent accounts and failure tolerance, see [StackSet
    # operation
    # options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
    property operation_preferences : StackSetOperationPreferences | Nil

    def initialize(
      @operation_id : String | Nil = nil,
      @action : StackSetOperationAction | Nil = nil,
      @status : StackSetOperationStatus | Nil = nil,
      @creation_timestamp : Time | Nil = nil,
      @end_timestamp : Time | Nil = nil,
      @status_reason : String | Nil = nil,
      @status_details : StackSetOperationStatusDetails | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      if value = @action
        params << {"#{prefix}Action", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @creation_timestamp
        params << {"#{prefix}CreationTimestamp", Core::QueryValue.time(value)}
      end

      if value = @end_timestamp
        params << {"#{prefix}EndTimestamp", Core::QueryValue.time(value)}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @status_details
        params.concat(value.to_query_params("#{prefix}StatusDetails."))
      end

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        action: (n = node.xpath_node("*[local-name()='Action']")) ? ACF::StackSetOperationAction.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetOperationStatus.from_json_object_key?(n.content) : nil,
        creation_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTimestamp']")),
        end_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTimestamp']")),
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        status_details: node.xpath_node("*[local-name()='StatusDetails']").try { |n| StackSetOperationStatusDetails.from_xml(n) },
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
      )
    end

    def_equals_and_hash(@operation_id, @action, @status, @creation_timestamp, @end_timestamp, @status_reason, @status_details, @operation_preferences)
  end
end
