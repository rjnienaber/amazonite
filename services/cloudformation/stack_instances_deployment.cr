private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Provides visibility into the stack instances deployment stage of a StackSet operation, including
  # per-stack-instance progress counts and a completion percentage. For service-managed operations
  # that provision roles, this stage begins after role provisioning finishes.
  class StackInstancesDeployment
    # The status of the stack instances deployment stage can be one of the following values:
    #
    # - `NOT_APPLICABLE`: The operation does not deploy stack instances, such as a drift detection
    # operation.
    #
    # - `NOT_STARTED`: Stack instances deployment has not started. The operation is still provisioning
    # roles, has not begun, or failed before this stage was reached.
    #
    # - `IN_PROGRESS`: At least one stack instance has started deploying.
    #
    # - `SUCCEEDED`: Deployment finished and succeeded for all stack instances that were not skipped.
    #
    # - `PARTIAL_SUCCESS`: Deployment finished with a mix of succeeded, failed, and canceled stack
    # instances.
    #
    # - `FAILED`: Deployment finished and every stack instance that was not skipped failed or was
    # canceled.
    property status : StageStatus | Nil

    # The number of stack instances that deployed successfully.
    property succeeded_stack_instances_count : Int32 | Nil

    # The number of stack instances that failed to deploy.
    property failed_stack_instances_count : Int32 | Nil

    # The number of stack instances that have reached a final state. This count includes stack
    # instances that succeeded, failed, were skipped, or were canceled.
    property completed_stack_instances_count : Int32 | Nil

    # The number of stack instances that have not reached a final state. This is the total number of
    # stack instances minus the completed count.
    property pending_stack_instances_count : Int32 | Nil

    # The number of stack instances that were canceled because the operation exceeded its failure
    # tolerance or was stopped.
    property cancelled_stack_instances_count : Int32 | Nil

    # The number of stack instances that were skipped because role provisioning failed for their
    # target account.
    property skipped_stack_instances_count : Int32 | Nil

    # The percentage of stack instances that have reached a final state.
    property percentage_completed : Float64 | Nil

    def initialize(
      @status : StageStatus | Nil = nil,
      @succeeded_stack_instances_count : Int32 | Nil = nil,
      @failed_stack_instances_count : Int32 | Nil = nil,
      @completed_stack_instances_count : Int32 | Nil = nil,
      @pending_stack_instances_count : Int32 | Nil = nil,
      @cancelled_stack_instances_count : Int32 | Nil = nil,
      @skipped_stack_instances_count : Int32 | Nil = nil,
      @percentage_completed : Float64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @succeeded_stack_instances_count
        params << {"#{prefix}SucceededStackInstancesCount", value.to_s}
      end

      if value = @failed_stack_instances_count
        params << {"#{prefix}FailedStackInstancesCount", value.to_s}
      end

      if value = @completed_stack_instances_count
        params << {"#{prefix}CompletedStackInstancesCount", value.to_s}
      end

      if value = @pending_stack_instances_count
        params << {"#{prefix}PendingStackInstancesCount", value.to_s}
      end

      if value = @cancelled_stack_instances_count
        params << {"#{prefix}CancelledStackInstancesCount", value.to_s}
      end

      if value = @skipped_stack_instances_count
        params << {"#{prefix}SkippedStackInstancesCount", value.to_s}
      end

      if value = @percentage_completed
        params << {"#{prefix}PercentageCompleted", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StageStatus.from_json_object_key?(n.content) : nil,
        succeeded_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='SucceededStackInstancesCount']")),
        failed_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailedStackInstancesCount']")),
        completed_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='CompletedStackInstancesCount']")),
        pending_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PendingStackInstancesCount']")),
        cancelled_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='CancelledStackInstancesCount']")),
        skipped_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='SkippedStackInstancesCount']")),
        percentage_completed: Core::XMLValue.f64(node.xpath_node("*[local-name()='PercentageCompleted']")),
      )
    end

    def validate! : Nil
      if value = @succeeded_stack_instances_count
        raise Core::ValidationError.new("SucceededStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @failed_stack_instances_count
        raise Core::ValidationError.new("FailedStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @completed_stack_instances_count
        raise Core::ValidationError.new("CompletedStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @pending_stack_instances_count
        raise Core::ValidationError.new("PendingStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @cancelled_stack_instances_count
        raise Core::ValidationError.new("CancelledStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @skipped_stack_instances_count
        raise Core::ValidationError.new("SkippedStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @percentage_completed
        raise Core::ValidationError.new("PercentageCompleted value must be >= 0") if value < 0
        raise Core::ValidationError.new("PercentageCompleted value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@status, @succeeded_stack_instances_count, @failed_stack_instances_count, @completed_stack_instances_count, @pending_stack_instances_count, @cancelled_stack_instances_count, @skipped_stack_instances_count, @percentage_completed)
  end
end
