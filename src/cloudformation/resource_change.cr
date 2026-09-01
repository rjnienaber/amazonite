private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The `ResourceChange` structure describes the resource and the action that CloudFormation will
  # perform on it if you execute this change set.
  class ResourceChange
    # The action that will be taken on the physical resource when the change set is executed.
    #
    # - `Delete` The resource will be deleted.
    #
    # - `Retain` The resource will be retained.
    #
    # - `Snapshot` The resource will have a snapshot taken.
    #
    # - `ReplaceAndDelete` The resource will be replaced and then deleted.
    #
    # - `ReplaceAndRetain` The resource will be replaced and then retained.
    #
    # - `ReplaceAndSnapshot` The resource will be replaced and then have a snapshot taken.
    property policy_action : PolicyAction | Nil

    # The action that CloudFormation takes on the resource, such as `Add` (adds a new resource),
    # `Modify` (changes a resource), `Remove` (deletes a resource), `Import` (imports a resource),
    # `Dynamic` (exact action for the resource can't be determined), or `SyncWithActual` (resource
    # will not be changed, only CloudFormation metadata will change).
    property action : ChangeAction | Nil

    # The resource's logical ID, which is defined in the stack's template.
    property logical_resource_id : String | Nil

    # The resource's physical ID (resource name). Resources that you are adding don't have physical
    # IDs because they haven't been created.
    property physical_resource_id : String | Nil

    # The type of CloudFormation resource, such as `AWS::S3::Bucket`.
    property resource_type : String | Nil

    # For the `Modify` action, indicates whether CloudFormation will replace the resource by creating
    # a new one and deleting the old one. This value depends on the value of the `RequiresRecreation`
    # property in the `ResourceTargetDefinition` structure. For example, if the `RequiresRecreation`
    # field is `Always` and the `Evaluation` field is `Static`, `Replacement` is `True`. If the
    # `RequiresRecreation` field is `Always` and the `Evaluation` field is `Dynamic`, `Replacement` is
    # `Conditional`.
    #
    # If you have multiple changes with different `RequiresRecreation` values, the `Replacement` value
    # depends on the change with the most impact. A `RequiresRecreation` value of `Always` has the
    # most impact, followed by `Conditional`, and then `Never`.
    property replacement : Replacement | Nil

    # For the `Modify` action, indicates which resource attribute is triggering this update, such as a
    # change in the resource attribute's `Metadata`, `Properties`, or `Tags`.
    property scope : Array(ResourceAttribute) | Nil

    # The drift status of the resource. Valid values:
    #
    # - `IN_SYNC` – The resource matches its template definition.
    #
    # - `MODIFIED` – Resource properties were modified outside CloudFormation.
    #
    # - `DELETED` – The resource was deleted outside CloudFormation.
    #
    # - `NOT_CHECKED` – CloudFormation doesn’t currently return this value.
    #
    # - `UNKNOWN` – Drift status could not be determined.
    #
    # - `UNSUPPORTED` – Resource type does not support actual state comparison.
    #
    # Only present for drift-aware change sets.
    property resource_drift_status : StackResourceDriftStatus | Nil

    # List of resource attributes for which drift was ignored.
    property resource_drift_ignored_attributes : Array(ResourceDriftIgnoredAttribute) | Nil

    # For the `Modify` action, a list of `ResourceChangeDetail` structures that describes the changes
    # that CloudFormation will make to the resource.
    property details : Array(ResourceChangeDetail) | Nil

    # The change set ID of the nested change set.
    property change_set_id : String | Nil

    # Contains information about the module from which the resource was created, if the resource was
    # created from a module included in the stack template.
    property module_info : ModuleInfo | Nil

    # An encoded JSON string that contains the context of the resource before the change is executed.
    property before_context : String | Nil

    # An encoded JSON string that contains the context of the resource after the change is executed.
    property after_context : String | Nil

    # Information about the resource's state from the previous CloudFormation deployment.
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

    def validate! : Nil
      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 256") if value.size > 256
      end

      if value = @resource_drift_ignored_attributes
        value.each(&.validate!)
      end

      if value = @details
        value.each(&.validate!)
      end

      if value = @change_set_id
        raise Core::ValidationError.new("ChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @module_info
        value.validate!
      end
    end

    def_equals_and_hash(@policy_action, @action, @logical_resource_id, @physical_resource_id, @resource_type, @replacement, @scope, @resource_drift_status, @resource_drift_ignored_attributes, @details, @change_set_id, @module_info, @before_context, @after_context, @previous_deployment_context)
  end
end
