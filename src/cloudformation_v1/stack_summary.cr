private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSummary
    property stack_id : String | Nil

    property stack_name : String

    property template_description : String | Nil

    property creation_time : Time

    property last_updated_time : Time | Nil

    property deletion_time : Time | Nil

    property stack_status : StackStatus

    property stack_status_reason : String | Nil

    property parent_id : String | Nil

    property root_id : String | Nil

    property drift_information : StackDriftInformationSummary | Nil

    property last_operations : Array(OperationEntry) | Nil

    def initialize(
      @stack_name : String,
      @creation_time : Time,
      @stack_status : StackStatus,
      @stack_id : String | Nil = nil,
      @template_description : String | Nil = nil,
      @last_updated_time : Time | Nil = nil,
      @deletion_time : Time | Nil = nil,
      @stack_status_reason : String | Nil = nil,
      @parent_id : String | Nil = nil,
      @root_id : String | Nil = nil,
      @drift_information : StackDriftInformationSummary | Nil = nil,
      @last_operations : Array(OperationEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      params << {"#{prefix}StackName", @stack_name}

      if value = @template_description
        params << {"#{prefix}TemplateDescription", value}
      end

      params << {"#{prefix}CreationTime", Core::QueryValue.time(@creation_time)}

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", Core::QueryValue.time(value)}
      end

      if value = @deletion_time
        params << {"#{prefix}DeletionTime", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}StackStatus", @stack_status.to_json_object_key}

      if value = @stack_status_reason
        params << {"#{prefix}StackStatusReason", value}
      end

      if value = @parent_id
        params << {"#{prefix}ParentId", value}
      end

      if value = @root_id
        params << {"#{prefix}RootId", value}
      end

      if value = @drift_information
        params.concat(value.to_query_params("#{prefix}DriftInformation."))
      end

      (@last_operations || [] of OperationEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LastOperations.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        template_description: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateDescription']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTime']")).not_nil!,
        last_updated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdatedTime']")),
        deletion_time: Core::XMLValue.time(node.xpath_node("*[local-name()='DeletionTime']")),
        stack_status: ((n = node.xpath_node("*[local-name()='StackStatus']")) ? ACF::StackStatus.from_json_object_key?(n.content) : nil).not_nil!,
        stack_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StackStatusReason']")),
        parent_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentId']")),
        root_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RootId']")),
        drift_information: node.xpath_node("*[local-name()='DriftInformation']").try { |n| StackDriftInformationSummary.from_xml(n) },
        last_operations: node.xpath_nodes("*[local-name()='LastOperations']/*[local-name()='member']").map { |n| OperationEntry.from_xml(n) },
      )
    end
  end
end
