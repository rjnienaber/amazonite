private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Detailed information about the drift status of the StackSet.
  #
  # For StackSets, contains information about the last *completed* drift operation performed on the
  # StackSet. Information about drift operations in-progress isn't included.
  #
  # For StackSet operations, includes information about drift operations currently being performed
  # on the StackSet.
  #
  # For more information, see [Performing drift detection on CloudFormation
  # StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html)
  # in the *CloudFormation User Guide*.
  class StackSetDriftDetectionDetails
    # Status of the StackSet's actual configuration compared to its expected template and parameter
    # configuration.
    #
    # - `DRIFTED`: One or more of the stack instances belonging to the StackSet differs from the
    # expected template and parameter configuration. A stack instance is considered to have drifted if
    # one or more of the resources in the associated stack have drifted.
    #
    # - `NOT_CHECKED`: CloudFormation hasn't checked the StackSet for drift.
    #
    # - `IN_SYNC`: All of the stack instances belonging to the StackSet stack match the expected
    # template and parameter configuration.
    property drift_status : StackSetDriftStatus | Nil

    # The status of the StackSet drift detection operation.
    #
    # - `COMPLETED`: The drift detection operation completed without failing on any stack instances.
    #
    # - `FAILED`: The drift detection operation exceeded the specified failure tolerance.
    #
    # - `PARTIAL_SUCCESS`: The drift detection operation completed without exceeding the failure
    # tolerance for the operation.
    #
    # - `IN_PROGRESS`: The drift detection operation is currently being performed.
    #
    # - `STOPPED`: The user has canceled the drift detection operation.
    property drift_detection_status : StackSetDriftDetectionStatus | Nil

    # Most recent time when CloudFormation performed a drift detection operation on the StackSet. This
    # value will be `NULL` for any StackSet that drift detection hasn't yet been performed on.
    property last_drift_check_timestamp : Time | Nil

    # The total number of stack instances belonging to this StackSet.
    #
    # The total number of stack instances is equal to the total of:
    #
    # - Stack instances that match the StackSet configuration.
    #
    # - Stack instances that have drifted from the StackSet configuration.
    #
    # - Stack instances where the drift detection operation has failed.
    #
    # - Stack instances currently being checked for drift.
    property total_stack_instances_count : Int32 | Nil

    # The number of stack instances that have drifted from the expected template and parameter
    # configuration of the StackSet. A stack instance is considered to have drifted if one or more of
    # the resources in the associated stack don't match their expected configuration.
    property drifted_stack_instances_count : Int32 | Nil

    # The number of stack instances which match the expected template and parameter configuration of
    # the StackSet.
    property in_sync_stack_instances_count : Int32 | Nil

    # The number of stack instances that are currently being checked for drift.
    property in_progress_stack_instances_count : Int32 | Nil

    # The number of stack instances for which the drift detection operation failed.
    property failed_stack_instances_count : Int32 | Nil

    def initialize(
      @drift_status : StackSetDriftStatus | Nil = nil,
      @drift_detection_status : StackSetDriftDetectionStatus | Nil = nil,
      @last_drift_check_timestamp : Time | Nil = nil,
      @total_stack_instances_count : Int32 | Nil = nil,
      @drifted_stack_instances_count : Int32 | Nil = nil,
      @in_sync_stack_instances_count : Int32 | Nil = nil,
      @in_progress_stack_instances_count : Int32 | Nil = nil,
      @failed_stack_instances_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @drift_status
        params << {"#{prefix}DriftStatus", value.to_json_object_key}
      end

      if value = @drift_detection_status
        params << {"#{prefix}DriftDetectionStatus", value.to_json_object_key}
      end

      if value = @last_drift_check_timestamp
        params << {"#{prefix}LastDriftCheckTimestamp", Core::QueryValue.time(value)}
      end

      if value = @total_stack_instances_count
        params << {"#{prefix}TotalStackInstancesCount", value.to_s}
      end

      if value = @drifted_stack_instances_count
        params << {"#{prefix}DriftedStackInstancesCount", value.to_s}
      end

      if value = @in_sync_stack_instances_count
        params << {"#{prefix}InSyncStackInstancesCount", value.to_s}
      end

      if value = @in_progress_stack_instances_count
        params << {"#{prefix}InProgressStackInstancesCount", value.to_s}
      end

      if value = @failed_stack_instances_count
        params << {"#{prefix}FailedStackInstancesCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        drift_status: (n = node.xpath_node("*[local-name()='DriftStatus']")) ? ACF::StackSetDriftStatus.from_json_object_key?(n.content) : nil,
        drift_detection_status: (n = node.xpath_node("*[local-name()='DriftDetectionStatus']")) ? ACF::StackSetDriftDetectionStatus.from_json_object_key?(n.content) : nil,
        last_drift_check_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='LastDriftCheckTimestamp']")),
        total_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalStackInstancesCount']")),
        drifted_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='DriftedStackInstancesCount']")),
        in_sync_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InSyncStackInstancesCount']")),
        in_progress_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InProgressStackInstancesCount']")),
        failed_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailedStackInstancesCount']")),
      )
    end
  end
end
