private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackDriftDetectionStatusOutput
    property stack_id : String

    property stack_drift_detection_id : String

    property stack_drift_status : StackDriftStatus | Nil

    property detection_status : StackDriftDetectionStatus

    property detection_status_reason : String | Nil

    property drifted_stack_resource_count : Int32 | Nil

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
  end
end
