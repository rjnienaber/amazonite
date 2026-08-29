private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceChange
    property policy_action : PolicyAction | Nil

    property action : ChangeAction | Nil

    property logical_resource_id : String | Nil

    property physical_resource_id : String | Nil

    property resource_type : String | Nil

    property replacement : Replacement | Nil

    property scope : Array(ResourceAttribute) | Nil

    property resource_drift_status : StackResourceDriftStatus | Nil

    property resource_drift_ignored_attributes : Array(ResourceDriftIgnoredAttribute) | Nil

    property details : Array(ResourceChangeDetail) | Nil

    property change_set_id : String | Nil

    property module_info : ModuleInfo | Nil

    property before_context : String | Nil

    property after_context : String | Nil

    property previous_deployment_context : String | Nil

    def initialize(
      @policy_action : PolicyAction | Nil = nil,
      @action : ChangeAction | Nil = nil,
      @logical_resource_id : String | Nil = nil,
      @physical_resource_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @replacement : Replacement | Nil = nil,
      @scope : Array(ResourceAttribute) | Nil = nil,
      @resource_drift_status : StackResourceDriftStatus | Nil = nil,
      @resource_drift_ignored_attributes : Array(ResourceDriftIgnoredAttribute) | Nil = nil,
      @details : Array(ResourceChangeDetail) | Nil = nil,
      @change_set_id : String | Nil = nil,
      @module_info : ModuleInfo | Nil = nil,
      @before_context : String | Nil = nil,
      @after_context : String | Nil = nil,
      @previous_deployment_context : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_action
        params << {"#{prefix}PolicyAction", value.to_json_object_key}
      end

      if value = @action
        params << {"#{prefix}Action", value.to_json_object_key}
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

      if value = @replacement
        params << {"#{prefix}Replacement", value.to_json_object_key}
      end

      (@scope || [] of ResourceAttribute).each_with_index(1) do |item, i|
        params << {"#{prefix}Scope.member.#{i}", item.to_json_object_key}
      end

      if value = @resource_drift_status
        params << {"#{prefix}ResourceDriftStatus", value.to_json_object_key}
      end

      (@resource_drift_ignored_attributes || [] of ResourceDriftIgnoredAttribute).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceDriftIgnoredAttributes.member.#{i}."))
      end

      (@details || [] of ResourceChangeDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Details.member.#{i}."))
      end

      if value = @change_set_id
        params << {"#{prefix}ChangeSetId", value}
      end

      if value = @module_info
        params.concat(value.to_query_params("#{prefix}ModuleInfo."))
      end

      if value = @before_context
        params << {"#{prefix}BeforeContext", value}
      end

      if value = @after_context
        params << {"#{prefix}AfterContext", value}
      end

      if value = @previous_deployment_context
        params << {"#{prefix}PreviousDeploymentContext", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_action: (n = node.xpath_node("*[local-name()='PolicyAction']")) ? ACF::PolicyAction.from_json_object_key?(n.content) : nil,
        action: (n = node.xpath_node("*[local-name()='Action']")) ? ACF::ChangeAction.from_json_object_key?(n.content) : nil,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        replacement: (n = node.xpath_node("*[local-name()='Replacement']")) ? ACF::Replacement.from_json_object_key?(n.content) : nil,
        scope: node.xpath_nodes("*[local-name()='Scope']/*[local-name()='member']").compact_map { |n| ACF::ResourceAttribute.from_json_object_key?(n.content) },
        resource_drift_status: (n = node.xpath_node("*[local-name()='ResourceDriftStatus']")) ? ACF::StackResourceDriftStatus.from_json_object_key?(n.content) : nil,
        resource_drift_ignored_attributes: node.xpath_nodes("*[local-name()='ResourceDriftIgnoredAttributes']/*[local-name()='member']").map { |n| ResourceDriftIgnoredAttribute.from_xml(n) },
        details: node.xpath_nodes("*[local-name()='Details']/*[local-name()='member']").map { |n| ResourceChangeDetail.from_xml(n) },
        change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetId']")),
        module_info: node.xpath_node("*[local-name()='ModuleInfo']").try { |n| ModuleInfo.from_xml(n) },
        before_context: Core::XMLValue.string(node.xpath_node("*[local-name()='BeforeContext']")),
        after_context: Core::XMLValue.string(node.xpath_node("*[local-name()='AfterContext']")),
        previous_deployment_context: Core::XMLValue.string(node.xpath_node("*[local-name()='PreviousDeploymentContext']")),
      )
    end
  end
end
