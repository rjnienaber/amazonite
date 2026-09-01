private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains the drift information for a resource that has been checked for drift. This includes
  # actual and expected property values for resources in which CloudFormation has detected drift.
  # Only resource properties explicitly defined in the stack template are checked for drift. For
  # more information, see [Detect unmanaged configuration changes to stacks and resources with drift
  # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  #
  # Resources that don't currently support drift detection can't be checked. For a list of resources
  # that support drift detection, see [Resource type support for imports and drift
  # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html).
  #
  # Use DetectStackResourceDrift to detect drift on individual resources, or DetectStackDrift to
  # detect drift on all resources in a given stack that support drift detection.
  class StackResourceDrift
    # The ID of the stack.
    property stack_id : String

    # The logical name of the resource specified in the template.
    property logical_resource_id : String

    # The name or unique identifier that corresponds to a physical instance ID of a resource supported
    # by CloudFormation.
    property physical_resource_id : String | Nil

    # Context information that enables CloudFormation to uniquely identify a resource. CloudFormation
    # uses context key-value pairs in cases where a resource's logical and physical IDs aren't enough
    # to uniquely identify that resource. Each context key-value pair specifies a unique resource that
    # contains the targeted resource.
    property physical_resource_id_context : Array(PhysicalResourceIdContextKeyValuePair) | Nil

    # The type of the resource.
    property resource_type : String

    # A JSON structure that contains the expected property values of the stack resource, as defined in
    # the stack template and any values specified as template parameters.
    #
    # For resources whose `StackResourceDriftStatus` is `DELETED`, this structure will not be present.
    property expected_properties : String | Nil

    # A JSON structure that contains the actual property values of the stack resource.
    #
    # For resources whose `StackResourceDriftStatus` is `DELETED`, this structure will not be present.
    property actual_properties : String | Nil

    # A collection of the resource properties whose actual values differ from their expected values.
    # These will be present only for resources whose `StackResourceDriftStatus` is `MODIFIED`.
    property property_differences : Array(PropertyDifference) | Nil

    # Status of the resource's actual configuration compared to its expected configuration.
    #
    # - `DELETED`: The resource differs from its expected template configuration because the resource
    # has been deleted.
    #
    # - `MODIFIED`: One or more resource properties differ from their expected values (as defined in
    # the stack template and any values specified as template parameters).
    #
    # - `IN_SYNC`: The resource's actual configuration matches its expected template configuration.
    #
    # - `NOT_CHECKED`: CloudFormation does not currently return this value.
    #
    # - `UNKNOWN`: CloudFormation could not run drift detection for the resource. See the
    # `DriftStatusReason` for details.
    property stack_resource_drift_status : StackResourceDriftStatus

    # Time at which CloudFormation performed drift detection on the stack resource.
    property timestamp : Time

    # Contains information about the module from which the resource was created, if the resource was
    # created from a module included in the stack template.
    property module_info : ModuleInfo | Nil

    # The reason for the drift status.
    property drift_status_reason : String | Nil

    def initialize(
      @stack_id : String,
      @logical_resource_id : String,
      @resource_type : String,
      @stack_resource_drift_status : StackResourceDriftStatus,
      @timestamp : Time,
      @physical_resource_id : String | Nil = nil,
      @physical_resource_id_context : Array(PhysicalResourceIdContextKeyValuePair) | Nil = nil,
      @expected_properties : String | Nil = nil,
      @actual_properties : String | Nil = nil,
      @property_differences : Array(PropertyDifference) | Nil = nil,
      @module_info : ModuleInfo | Nil = nil,
      @drift_status_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackId", @stack_id}

      params << {"#{prefix}LogicalResourceId", @logical_resource_id}

      if value = @physical_resource_id
        params << {"#{prefix}PhysicalResourceId", value}
      end

      (@physical_resource_id_context || [] of PhysicalResourceIdContextKeyValuePair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PhysicalResourceIdContext.member.#{i}."))
      end

      params << {"#{prefix}ResourceType", @resource_type}

      if value = @expected_properties
        params << {"#{prefix}ExpectedProperties", value}
      end

      if value = @actual_properties
        params << {"#{prefix}ActualProperties", value}
      end

      (@property_differences || [] of PropertyDifference).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PropertyDifferences.member.#{i}."))
      end

      params << {"#{prefix}StackResourceDriftStatus", @stack_resource_drift_status.to_json_object_key}

      params << {"#{prefix}Timestamp", Core::QueryValue.time(@timestamp)}

      if value = @module_info
        params.concat(value.to_query_params("#{prefix}ModuleInfo."))
      end

      if value = @drift_status_reason
        params << {"#{prefix}DriftStatusReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        physical_resource_id_context: node.xpath_nodes("*[local-name()='PhysicalResourceIdContext']/*[local-name()='member']").map { |n| PhysicalResourceIdContextKeyValuePair.from_xml(n) },
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")).not_nil!,
        expected_properties: Core::XMLValue.string(node.xpath_node("*[local-name()='ExpectedProperties']")),
        actual_properties: Core::XMLValue.string(node.xpath_node("*[local-name()='ActualProperties']")),
        property_differences: node.xpath_nodes("*[local-name()='PropertyDifferences']/*[local-name()='member']").map { |n| PropertyDifference.from_xml(n) },
        stack_resource_drift_status: ((n = node.xpath_node("*[local-name()='StackResourceDriftStatus']")) ? ACF::StackResourceDriftStatus.from_json_object_key?(n.content) : nil).not_nil!,
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")).not_nil!,
        module_info: node.xpath_node("*[local-name()='ModuleInfo']").try { |n| ModuleInfo.from_xml(n) },
        drift_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='DriftStatusReason']")),
      )
    end

    def validate! : Nil
      if value = @physical_resource_id_context
        raise Core::ValidationError.new("PhysicalResourceIdContext must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("PhysicalResourceIdContext must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 256") if value.size > 256
      end

      if value = @property_differences
        value.each(&.validate!)
      end

      if value = @module_info
        value.validate!
      end
    end

    def_equals_and_hash(@stack_id, @logical_resource_id, @physical_resource_id, @physical_resource_id_context, @resource_type, @expected_properties, @actual_properties, @property_differences, @stack_resource_drift_status, @timestamp, @module_info, @drift_status_reason)
  end
end
