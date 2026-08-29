private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackInstanceResourceDriftsInput
    property stack_set_name : String

    property next_token : String | Nil

    property max_results : Int32 | Nil

    property stack_instance_resource_drift_statuses : Array(StackResourceDriftStatus) | Nil

    property stack_instance_account : String

    property stack_instance_region : String

    property operation_id : String

    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @stack_instance_account : String,
      @stack_instance_region : String,
      @operation_id : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @stack_instance_resource_drift_statuses : Array(StackResourceDriftStatus) | Nil = nil,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@stack_instance_resource_drift_statuses || [] of StackResourceDriftStatus).each_with_index(1) do |item, i|
        params << {"#{prefix}StackInstanceResourceDriftStatuses.member.#{i}", item.to_json_object_key}
      end

      params << {"#{prefix}StackInstanceAccount", @stack_instance_account}

      params << {"#{prefix}StackInstanceRegion", @stack_instance_region}

      params << {"#{prefix}OperationId", @operation_id}

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        stack_instance_resource_drift_statuses: node.xpath_nodes("*[local-name()='StackInstanceResourceDriftStatuses']/*[local-name()='member']").compact_map { |n| ACF::StackResourceDriftStatus.from_json_object_key?(n.content) },
        stack_instance_account: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceAccount']")).not_nil!,
        stack_instance_region: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceRegion']")).not_nil!,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")).not_nil!,
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
