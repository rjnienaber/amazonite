private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class OperationEvent
    property event_id : String | Nil

    property stack_id : String | Nil

    property operation_id : String | Nil

    property operation_type : OperationType | Nil

    property operation_status : BeaconStackOperationStatus | Nil

    property event_type : EventType | Nil

    property logical_resource_id : String | Nil

    property physical_resource_id : String | Nil

    property resource_type : String | Nil

    property timestamp : Time | Nil

    property start_time : Time | Nil

    property end_time : Time | Nil

    property resource_status : ResourceStatus | Nil

    property resource_status_reason : String | Nil

    property resource_properties : String | Nil

    property client_request_token : String | Nil

    property hook_type : String | Nil

    property hook_status : HookStatus | Nil

    property hook_status_reason : String | Nil

    property hook_invocation_point : HookInvocationPoint | Nil

    property hook_failure_mode : HookFailureMode | Nil

    property detailed_status : DetailedStatus | Nil

    property validation_failure_mode : HookFailureMode | Nil

    property validation_name : String | Nil

    property validation_status : ValidationStatus | Nil

    property validation_status_reason : String | Nil

    property validation_path : String | Nil

    def initialize(
      @event_id : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @operation_id : String | Nil = nil,
      @operation_type : OperationType | Nil = nil,
      @operation_status : BeaconStackOperationStatus | Nil = nil,
      @event_type : EventType | Nil = nil,
      @logical_resource_id : String | Nil = nil,
      @physical_resource_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @timestamp : Time | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @resource_status : ResourceStatus | Nil = nil,
      @resource_status_reason : String | Nil = nil,
      @resource_properties : String | Nil = nil,
      @client_request_token : String | Nil = nil,
      @hook_type : String | Nil = nil,
      @hook_status : HookStatus | Nil = nil,
      @hook_status_reason : String | Nil = nil,
      @hook_invocation_point : HookInvocationPoint | Nil = nil,
      @hook_failure_mode : HookFailureMode | Nil = nil,
      @detailed_status : DetailedStatus | Nil = nil,
      @validation_failure_mode : HookFailureMode | Nil = nil,
      @validation_name : String | Nil = nil,
      @validation_status : ValidationStatus | Nil = nil,
      @validation_status_reason : String | Nil = nil,
      @validation_path : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @event_id
        params << {"#{prefix}EventId", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      if value = @operation_type
        params << {"#{prefix}OperationType", value.to_json_object_key}
      end

      if value = @operation_status
        params << {"#{prefix}OperationStatus", value.to_json_object_key}
      end

      if value = @event_type
        params << {"#{prefix}EventType", value.to_json_object_key}
      end

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end

      if value = @physical_resource_id
        params << {"#{prefix}PhysicalResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      if value = @resource_status
        params << {"#{prefix}ResourceStatus", value.to_json_object_key}
      end

      if value = @resource_status_reason
        params << {"#{prefix}ResourceStatusReason", value}
      end

      if value = @resource_properties
        params << {"#{prefix}ResourceProperties", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      if value = @hook_type
        params << {"#{prefix}HookType", value}
      end

      if value = @hook_status
        params << {"#{prefix}HookStatus", value.to_json_object_key}
      end

      if value = @hook_status_reason
        params << {"#{prefix}HookStatusReason", value}
      end

      if value = @hook_invocation_point
        params << {"#{prefix}HookInvocationPoint", value.to_json_object_key}
      end

      if value = @hook_failure_mode
        params << {"#{prefix}HookFailureMode", value.to_json_object_key}
      end

      if value = @detailed_status
        params << {"#{prefix}DetailedStatus", value.to_json_object_key}
      end

      if value = @validation_failure_mode
        params << {"#{prefix}ValidationFailureMode", value.to_json_object_key}
      end

      if value = @validation_name
        params << {"#{prefix}ValidationName", value}
      end

      if value = @validation_status
        params << {"#{prefix}ValidationStatus", value.to_json_object_key}
      end

      if value = @validation_status_reason
        params << {"#{prefix}ValidationStatusReason", value}
      end

      if value = @validation_path
        params << {"#{prefix}ValidationPath", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        event_id: Core::XMLValue.string(node.xpath_node("*[local-name()='EventId']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        operation_type: (n = node.xpath_node("*[local-name()='OperationType']")) ? ACF::OperationType.from_json_object_key?(n.content) : nil,
        operation_status: (n = node.xpath_node("*[local-name()='OperationStatus']")) ? ACF::BeaconStackOperationStatus.from_json_object_key?(n.content) : nil,
        event_type: (n = node.xpath_node("*[local-name()='EventType']")) ? ACF::EventType.from_json_object_key?(n.content) : nil,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")),
        resource_status: (n = node.xpath_node("*[local-name()='ResourceStatus']")) ? ACF::ResourceStatus.from_json_object_key?(n.content) : nil,
        resource_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceStatusReason']")),
        resource_properties: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceProperties']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        hook_type: Core::XMLValue.string(node.xpath_node("*[local-name()='HookType']")),
        hook_status: (n = node.xpath_node("*[local-name()='HookStatus']")) ? ACF::HookStatus.from_json_object_key?(n.content) : nil,
        hook_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='HookStatusReason']")),
        hook_invocation_point: (n = node.xpath_node("*[local-name()='HookInvocationPoint']")) ? ACF::HookInvocationPoint.from_json_object_key?(n.content) : nil,
        hook_failure_mode: (n = node.xpath_node("*[local-name()='HookFailureMode']")) ? ACF::HookFailureMode.from_json_object_key?(n.content) : nil,
        detailed_status: (n = node.xpath_node("*[local-name()='DetailedStatus']")) ? ACF::DetailedStatus.from_json_object_key?(n.content) : nil,
        validation_failure_mode: (n = node.xpath_node("*[local-name()='ValidationFailureMode']")) ? ACF::HookFailureMode.from_json_object_key?(n.content) : nil,
        validation_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ValidationName']")),
        validation_status: (n = node.xpath_node("*[local-name()='ValidationStatus']")) ? ACF::ValidationStatus.from_json_object_key?(n.content) : nil,
        validation_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ValidationStatusReason']")),
        validation_path: Core::XMLValue.string(node.xpath_node("*[local-name()='ValidationPath']")),
      )
    end
  end
end
