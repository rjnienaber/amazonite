private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackResource
    property stack_name : String | Nil

    property stack_id : String | Nil

    property logical_resource_id : String

    property physical_resource_id : String | Nil

    property resource_type : String

    property timestamp : Time

    property resource_status : ResourceStatus

    property resource_status_reason : String | Nil

    property description : String | Nil

    property drift_information : StackResourceDriftInformation | Nil

    property module_info : ModuleInfo | Nil

    def initialize(
      @logical_resource_id : String,
      @resource_type : String,
      @timestamp : Time,
      @resource_status : ResourceStatus,
      @stack_name : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @physical_resource_id : String | Nil = nil,
      @resource_status_reason : String | Nil = nil,
      @description : String | Nil = nil,
      @drift_information : StackResourceDriftInformation | Nil = nil,
      @module_info : ModuleInfo | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      params << {"#{prefix}LogicalResourceId", @logical_resource_id}

      if value = @physical_resource_id
        params << {"#{prefix}PhysicalResourceId", value}
      end

      params << {"#{prefix}ResourceType", @resource_type}

      params << {"#{prefix}Timestamp", Core::QueryValue.time(@timestamp)}

      params << {"#{prefix}ResourceStatus", @resource_status.to_json_object_key}

      if value = @resource_status_reason
        params << {"#{prefix}ResourceStatusReason", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @drift_information
        params.concat(value.to_query_params("#{prefix}DriftInformation."))
      end

      if value = @module_info
        params.concat(value.to_query_params("#{prefix}ModuleInfo."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")).not_nil!,
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")).not_nil!,
        resource_status: ((n = node.xpath_node("*[local-name()='ResourceStatus']")) ? ACF::ResourceStatus.from_json_object_key?(n.content) : nil).not_nil!,
        resource_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceStatusReason']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        drift_information: node.xpath_node("*[local-name()='DriftInformation']").try { |n| StackResourceDriftInformation.from_xml(n) },
        module_info: node.xpath_node("*[local-name()='ModuleInfo']").try { |n| ModuleInfo.from_xml(n) },
      )
    end
  end
end
