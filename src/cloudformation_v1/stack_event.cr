private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackEvent
    property stack_id : String

    property event_id : String

    property stack_name : String

    property operation_id : String | Nil

    property logical_resource_id : String | Nil

    property physical_resource_id : String | Nil

    property resource_type : String | Nil

    property timestamp : Time

    property resource_status : ResourceStatus | Nil

    property resource_status_reason : String | Nil

    property resource_properties : String | Nil

    property client_request_token : String | Nil

    property hook_type : String | Nil

    property hook_status : HookStatus | Nil

    property hook_status_reason : String | Nil

    property hook_invocation_point : HookInvocationPoint | Nil

    property hook_invocation_id : String | Nil

    property hook_failure_mode : HookFailureMode | Nil

    property detailed_status : DetailedStatus | Nil

    def initialize(
      @stack_id : String,
      @event_id : String,
      @stack_name : String,
      @timestamp : Time,
      @operation_id : String | Nil = nil,
      @logical_resource_id : String | Nil = nil,
      @physical_resource_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @resource_status : ResourceStatus | Nil = nil,
      @resource_status_reason : String | Nil = nil,
      @resource_properties : String | Nil = nil,
      @client_request_token : String | Nil = nil,
      @hook_type : String | Nil = nil,
      @hook_status : HookStatus | Nil = nil,
      @hook_status_reason : String | Nil = nil,
      @hook_invocation_point : HookInvocationPoint | Nil = nil,
      @hook_invocation_id : String | Nil = nil,
      @hook_failure_mode : HookFailureMode | Nil = nil,
      @detailed_status : DetailedStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackId", @stack_id}

      params << {"#{prefix}EventId", @event_id}

      params << {"#{prefix}StackName", @stack_name}

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
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

      params << {"#{prefix}Timestamp", Core::QueryValue.time(@timestamp)}

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

      if value = @hook_invocation_id
        params << {"#{prefix}HookInvocationId", value}
      end

      if value = @hook_failure_mode
        params << {"#{prefix}HookFailureMode", value.to_json_object_key}
      end

      if value = @detailed_status
        params << {"#{prefix}DetailedStatus", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")).not_nil!,
        event_id: Core::XMLValue.string(node.xpath_node("*[local-name()='EventId']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")).not_nil!,
        resource_status: (n = node.xpath_node("*[local-name()='ResourceStatus']")) ? ACF::ResourceStatus.from_json_object_key?(n.content) : nil,
        resource_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceStatusReason']")),
        resource_properties: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceProperties']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        hook_type: Core::XMLValue.string(node.xpath_node("*[local-name()='HookType']")),
        hook_status: (n = node.xpath_node("*[local-name()='HookStatus']")) ? ACF::HookStatus.from_json_object_key?(n.content) : nil,
        hook_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='HookStatusReason']")),
        hook_invocation_point: (n = node.xpath_node("*[local-name()='HookInvocationPoint']")) ? ACF::HookInvocationPoint.from_json_object_key?(n.content) : nil,
        hook_invocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='HookInvocationId']")),
        hook_failure_mode: (n = node.xpath_node("*[local-name()='HookFailureMode']")) ? ACF::HookFailureMode.from_json_object_key?(n.content) : nil,
        detailed_status: (n = node.xpath_node("*[local-name()='DetailedStatus']")) ? ACF::DetailedStatus.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
