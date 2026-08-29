private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSet
    property stack_set_name : String | Nil

    property stack_set_id : String | Nil

    property description : String | Nil

    property status : StackSetStatus | Nil

    property template_body : String | Nil

    property parameters : Array(Parameter) | Nil

    property capabilities : Array(Capability) | Nil

    property tags : Array(Tag) | Nil

    property stack_set_arn : String | Nil

    property administration_role_arn : String | Nil

    property execution_role_name : String | Nil

    property stack_set_drift_detection_details : StackSetDriftDetectionDetails | Nil

    property auto_deployment : AutoDeployment | Nil

    property permission_model : PermissionModels | Nil

    property organizational_unit_ids : Array(String) | Nil

    property managed_execution : ManagedExecution | Nil

    property regions : Array(String) | Nil

    def initialize(
      @stack_set_name : String | Nil = nil,
      @stack_set_id : String | Nil = nil,
      @description : String | Nil = nil,
      @status : StackSetStatus | Nil = nil,
      @template_body : String | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @stack_set_arn : String | Nil = nil,
      @administration_role_arn : String | Nil = nil,
      @execution_role_name : String | Nil = nil,
      @stack_set_drift_detection_details : StackSetDriftDetectionDetails | Nil = nil,
      @auto_deployment : AutoDeployment | Nil = nil,
      @permission_model : PermissionModels | Nil = nil,
      @organizational_unit_ids : Array(String) | Nil = nil,
      @managed_execution : ManagedExecution | Nil = nil,
      @regions : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set_name
        params << {"#{prefix}StackSetName", value}
      end

      if value = @stack_set_id
        params << {"#{prefix}StackSetId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @template_body
        params << {"#{prefix}TemplateBody", value}
      end

      (@parameters || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end

      (@capabilities || [] of Capability).each_with_index(1) do |item, i|
        params << {"#{prefix}Capabilities.member.#{i}", item.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @stack_set_arn
        params << {"#{prefix}StackSetARN", value}
      end

      if value = @administration_role_arn
        params << {"#{prefix}AdministrationRoleARN", value}
      end

      if value = @execution_role_name
        params << {"#{prefix}ExecutionRoleName", value}
      end

      if value = @stack_set_drift_detection_details
        params.concat(value.to_query_params("#{prefix}StackSetDriftDetectionDetails."))
      end

      if value = @auto_deployment
        params.concat(value.to_query_params("#{prefix}AutoDeployment."))
      end

      if value = @permission_model
        params << {"#{prefix}PermissionModel", value.to_json_object_key}
      end

      (@organizational_unit_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OrganizationalUnitIds.member.#{i}", item}
      end

      if value = @managed_execution
        params.concat(value.to_query_params("#{prefix}ManagedExecution."))
      end

      (@regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Regions.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")),
        stack_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetStatus.from_json_object_key?(n.content) : nil,
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        stack_set_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetARN']")),
        administration_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='AdministrationRoleARN']")),
        execution_role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleName']")),
        stack_set_drift_detection_details: node.xpath_node("*[local-name()='StackSetDriftDetectionDetails']").try { |n| StackSetDriftDetectionDetails.from_xml(n) },
        auto_deployment: node.xpath_node("*[local-name()='AutoDeployment']").try { |n| AutoDeployment.from_xml(n) },
        permission_model: (n = node.xpath_node("*[local-name()='PermissionModel']")) ? ACF::PermissionModels.from_json_object_key?(n.content) : nil,
        organizational_unit_ids: node.xpath_nodes("*[local-name()='OrganizationalUnitIds']/*[local-name()='member']").map { |n| n.content },
        managed_execution: node.xpath_node("*[local-name()='ManagedExecution']").try { |n| ManagedExecution.from_xml(n) },
        regions: node.xpath_nodes("*[local-name()='Regions']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
