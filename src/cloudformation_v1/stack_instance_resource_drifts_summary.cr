private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The structure containing summary information about resource drifts for a stack instance.
  class StackInstanceResourceDriftsSummary
    # The ID of the stack instance.
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

    # Type of resource. For more information, see [Amazon Web Services resource and property types
    # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
    # in the *CloudFormation User Guide*.
    property resource_type : String

    # Status of the actual configuration of the resource compared to its expected configuration. These
    # will be present only for resources whose `StackInstanceResourceDriftStatus` is `MODIFIED`.
    property property_differences : Array(PropertyDifference) | Nil

    # The drift status of the resource in a stack instance.
    #
    # - `DELETED`: The resource differs from its expected template configuration in that the resource
    # has been deleted.
    #
    # - `MODIFIED`: One or more resource properties differ from their expected template values.
    #
    # - `IN_SYNC`: The resource's actual configuration matches its expected template configuration.
    #
    # - `NOT_CHECKED`: CloudFormation doesn't currently return this value.
    property stack_resource_drift_status : StackResourceDriftStatus

    # Time at which the stack instance drift detection operation was initiated.
    property timestamp : Time

    def initialize(
      @stack_id : String,
      @logical_resource_id : String,
      @resource_type : String,
      @stack_resource_drift_status : StackResourceDriftStatus,
      @timestamp : Time,
      @physical_resource_id : String | Nil = nil,
      @physical_resource_id_context : Array(PhysicalResourceIdContextKeyValuePair) | Nil = nil,
      @property_differences : Array(PropertyDifference) | Nil = nil,
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

      (@property_differences || [] of PropertyDifference).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PropertyDifferences.member.#{i}."))
      end

      params << {"#{prefix}StackResourceDriftStatus", @stack_resource_drift_status.to_json_object_key}

      params << {"#{prefix}Timestamp", Core::QueryValue.time(@timestamp)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        physical_resource_id_context: node.xpath_nodes("*[local-name()='PhysicalResourceIdContext']/*[local-name()='member']").map { |n| PhysicalResourceIdContextKeyValuePair.from_xml(n) },
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")).not_nil!,
        property_differences: node.xpath_nodes("*[local-name()='PropertyDifferences']/*[local-name()='member']").map { |n| PropertyDifference.from_xml(n) },
        stack_resource_drift_status: ((n = node.xpath_node("*[local-name()='StackResourceDriftStatus']")) ? ACF::StackResourceDriftStatus.from_json_object_key?(n.content) : nil).not_nil!,
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")).not_nil!,
      )
    end

    def_equals_and_hash(@stack_id, @logical_resource_id, @physical_resource_id, @physical_resource_id_context, @resource_type, @property_differences, @stack_resource_drift_status, @timestamp)
  end
end
