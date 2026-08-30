private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `StackResource` data type.
  class StackResource
    # The name associated with the stack.
    property stack_name : String | Nil

    # Unique identifier of the stack.
    property stack_id : String | Nil

    # The logical name of the resource specified in the template.
    property logical_resource_id : String

    # The name or unique identifier that corresponds to a physical instance ID of a resource supported
    # by CloudFormation.
    property physical_resource_id : String | Nil

    # Type of resource. For more information, see [Amazon Web Services resource and property types
    # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
    # in the *CloudFormation User Guide*.
    property resource_type : String

    # Time the status was updated.
    property timestamp : Time

    # Current status of the resource.
    property resource_status : ResourceStatus

    # Success/failure message associated with the resource.
    property resource_status_reason : String | Nil

    # User defined description associated with the resource.
    property description : String | Nil

    # Information about whether the resource's actual configuration differs, or has *drifted*, from
    # its expected configuration, as defined in the stack template and any values specified as
    # template parameters. For more information, see [Detect unmanaged configuration changes to stacks
    # and resources with drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
    property drift_information : StackResourceDriftInformation | Nil

    # Contains information about the module from which the resource was created, if the resource was
    # created from a module included in the stack template.
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

    def validate! : Nil
      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 256") if value.size > 256
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @drift_information
        value.validate!
      end

      if value = @module_info
        value.validate!
      end
    end

    def_equals_and_hash(@stack_name, @stack_id, @logical_resource_id, @physical_resource_id, @resource_type, @timestamp, @resource_status, @resource_status_reason, @description, @drift_information, @module_info)
  end
end
