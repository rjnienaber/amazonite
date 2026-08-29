private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackInstanceResourceDriftsSummary
    property stack_id : String

    property logical_resource_id : String

    property physical_resource_id : String | Nil

    property physical_resource_id_context : Array(PhysicalResourceIdContextKeyValuePair) | Nil

    property resource_type : String

    property property_differences : Array(PropertyDifference) | Nil

    property stack_resource_drift_status : StackResourceDriftStatus

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
  end
end
