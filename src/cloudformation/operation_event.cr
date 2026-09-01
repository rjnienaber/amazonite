private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains detailed information about an event that occurred during a CloudFormation operation.
  class OperationEvent
    # A unique identifier for this event.
    property event_id : String | Nil

    # The unique ID name of the instance of the stack.
    property stack_id : String | Nil

    # The unique identifier of the operation this event belongs to.
    property operation_id : String | Nil

    # The type of operation.
    property operation_type : OperationType | Nil

    # The current status of the operation.
    property operation_status : BeaconStackOperationStatus | Nil

    # The type of event.
    property event_type : EventType | Nil

    # The logical name of the resource as specified in the template.
    property logical_resource_id : String | Nil

    # The name or unique identifier that corresponds to a physical instance ID of a resource.
    property physical_resource_id : String | Nil

    # Type of resource.
    property resource_type : String | Nil

    # Time the status was updated.
    property timestamp : Time | Nil

    # The time when the event started.
    property start_time : Time | Nil

    # The time when the event ended.
    property end_time : Time | Nil

    # Current status of the resource.
    property resource_status : ResourceStatus | Nil

    # Success or failure message associated with the resource.
    property resource_status_reason : String | Nil

    # The properties used to create the resource.
    property resource_properties : String | Nil

    # A unique identifier for the request that initiated this operation.
    property client_request_token : String | Nil

    # The type name of the Hook that was invoked.
    property hook_type : String | Nil

    # The status of the Hook invocation.
    property hook_status : HookStatus | Nil

    # Additional information about the Hook status.
    property hook_status_reason : String | Nil

    # The point in the operation lifecycle when the Hook was invoked.
    property hook_invocation_point : HookInvocationPoint | Nil

    # Specifies how Hook failures are handled.
    property hook_failure_mode : HookFailureMode | Nil

    # Additional status information about the operation.
    property detailed_status : DetailedStatus | Nil

    # Specifies how validation failures are handled.
    property validation_failure_mode : HookFailureMode | Nil

    # The name of the validation that was performed.
    property validation_name : String | Nil

    # The status of the validation.
    property validation_status : ValidationStatus | Nil

    # Additional information about the validation status.
    property validation_status_reason : String | Nil

    # The path within the resource where the validation was applied.
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

    def validate! : Nil
      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 256") if value.size > 256
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ClientRequestToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end

      if value = @hook_type
        raise Core::ValidationError.new("HookType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("HookType length must be <= 255") if value.size > 255
      end

      if value = @hook_status_reason
        raise Core::ValidationError.new("HookStatusReason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("HookStatusReason length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@event_id, @stack_id, @operation_id, @operation_type, @operation_status, @event_type, @logical_resource_id, @physical_resource_id, @resource_type, @timestamp, @start_time, @end_time, @resource_status, @resource_status_reason, @resource_properties, @client_request_token, @hook_type, @hook_status, @hook_status_reason, @hook_invocation_point, @hook_failure_mode, @detailed_status, @validation_failure_mode, @validation_name, @validation_status, @validation_status_reason, @validation_path)
  end
end
