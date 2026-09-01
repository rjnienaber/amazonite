private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DescribeStackDriftDetectionStatusOutput
    # The ID of the stack.
    property stack_id : String

    # The ID of the drift detection results of this operation.
    #
    # CloudFormation generates new results, with a new drift detection ID, each time this operation is
    # run. However, the number of reports CloudFormation retains for any given stack, and for how
    # long, may vary.
    property stack_drift_detection_id : String

    # Status of the stack's actual configuration compared to its expected configuration.
    #
    # - `DRIFTED`: The stack differs from its expected template configuration. A stack is considered
    # to have drifted if one or more of its resources have drifted.
    #
    # - `NOT_CHECKED`: CloudFormation hasn't checked if the stack differs from its expected template
    # configuration.
    #
    # - `IN_SYNC`: The stack's actual configuration matches its expected template configuration.
    #
    # - `UNKNOWN`: CloudFormation could not run drift detection for a resource in the stack. See the
    # `DetectionStatusReason` for details.
    property stack_drift_status : StackDriftStatus | Nil

    # The status of the stack drift detection operation.
    #
    # - `DETECTION_COMPLETE`: The stack drift detection operation has successfully completed for all
    # resources in the stack that support drift detection. (Resources that don't currently support
    # stack detection remain unchecked.)
    #
    # If you specified logical resource IDs for CloudFormation to use as a filter for the stack drift
    # detection operation, only the resources with those logical IDs are checked for drift.
    #
    # - `DETECTION_FAILED`: The stack drift detection operation has failed for at least one resource
    # in the stack. Results will be available for resources on which CloudFormation successfully
    # completed drift detection.
    #
    # - `DETECTION_IN_PROGRESS`: The stack drift detection operation is currently in progress.
    property detection_status : StackDriftDetectionStatus

    # The reason the stack drift detection operation has its current status.
    property detection_status_reason : String | Nil

    # Total number of stack resources that have drifted. This is NULL until the drift detection
    # operation reaches a status of `DETECTION_COMPLETE`. This value will be 0 for stacks whose drift
    # status is `IN_SYNC`.
    property drifted_stack_resource_count : Int32 | Nil

    # Time at which the stack drift detection operation was initiated.
    property timestamp : Time

    def initialize(
      @stack_id : String,
      @stack_drift_detection_id : String,
      @detection_status : StackDriftDetectionStatus,
      @timestamp : Time,
      @stack_drift_status : StackDriftStatus | Nil = nil,
      @detection_status_reason : String | Nil = nil,
      @drifted_stack_resource_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackId", @stack_id}

      params << {"#{prefix}StackDriftDetectionId", @stack_drift_detection_id}

      if value = @stack_drift_status
        params << {"#{prefix}StackDriftStatus", value.to_json_object_key}
      end

      params << {"#{prefix}DetectionStatus", @detection_status.to_json_object_key}

      if value = @detection_status_reason
        params << {"#{prefix}DetectionStatusReason", value}
      end

      if value = @drifted_stack_resource_count
        params << {"#{prefix}DriftedStackResourceCount", value.to_s}
      end

      params << {"#{prefix}Timestamp", Core::QueryValue.time(@timestamp)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")).not_nil!,
        stack_drift_detection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackDriftDetectionId']")).not_nil!,
        stack_drift_status: (n = node.xpath_node("*[local-name()='StackDriftStatus']")) ? ACF::StackDriftStatus.from_json_object_key?(n.content) : nil,
        detection_status: ((n = node.xpath_node("*[local-name()='DetectionStatus']")) ? ACF::StackDriftDetectionStatus.from_json_object_key?(n.content) : nil).not_nil!,
        detection_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='DetectionStatusReason']")),
        drifted_stack_resource_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='DriftedStackResourceCount']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @stack_drift_detection_id
        raise Core::ValidationError.new("StackDriftDetectionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackDriftDetectionId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@stack_id, @stack_drift_detection_id, @stack_drift_status, @detection_status, @detection_status_reason, @drifted_stack_resource_count, @timestamp)
  end
end
