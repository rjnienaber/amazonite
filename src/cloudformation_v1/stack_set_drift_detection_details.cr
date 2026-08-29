private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSetDriftDetectionDetails
    property drift_status : StackSetDriftStatus | Nil

    property drift_detection_status : StackSetDriftDetectionStatus | Nil

    property last_drift_check_timestamp : Time | Nil

    property total_stack_instances_count : Int32 | Nil

    property drifted_stack_instances_count : Int32 | Nil

    property in_sync_stack_instances_count : Int32 | Nil

    property in_progress_stack_instances_count : Int32 | Nil

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
