private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # A structure that contains information about a StackSet. With StackSets, you can provision stacks
  # across Amazon Web Services accounts and Regions from a single CloudFormation template. Each
  # stack is based on the same CloudFormation template, but you can customize individual stacks
  # using parameters.
  class StackSet
    # The name that's associated with the StackSet.
    property stack_set_name : String | Nil

    # The ID of the StackSet.
    property stack_set_id : String | Nil

    # A description of the StackSet that you specify when the StackSet is created or updated.
    property description : String | Nil

    # The status of the StackSet.
    property status : StackSetStatus | Nil

    # The structure that contains the body of the template that was used to create or update the
    # StackSet.
    property template_body : String | Nil

    # A list of input parameters for a StackSet.
    property parameters : Array(Parameter) | Nil

    # The capabilities that are allowed in the StackSet. Some StackSet templates might include
    # resources that can affect permissions in your Amazon Web Services account—for example, by
    # creating new Identity and Access Management (IAM) users. For more information, see
    # [Acknowledging IAM resources in CloudFormation
    # templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities).
    property capabilities : Array(Capability) | Nil

    # A list of tags that specify information about the StackSet. A maximum number of 50 tags can be
    # specified.
    property tags : Array(Tag) | Nil

    # The Amazon Resource Name (ARN) of the StackSet.
    property stack_set_arn : String | Nil

    # The Amazon Resource Name (ARN) of the IAM role used to create or update the stack set.
    #
    # Use customized administrator roles to control which users or groups can manage specific
    # StackSets within the same administrator account. For more information, see [Prerequisites for
    # using CloudFormation
    # StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html)
    # in the *CloudFormation User Guide*.
    property administration_role_arn : String | Nil

    # The name of the IAM execution role used to create or update the StackSet.
    #
    # Use customized execution roles to control which stack resources users and groups can include in
    # their StackSets.
    property execution_role_name : String | Nil

    # Detailed information about the drift status of the StackSet.
    #
    # For StackSets, contains information about the last *completed* drift operation performed on the
    # StackSet. Information about drift operations currently in progress isn't included.
    property stack_set_drift_detection_details : StackSetDriftDetectionDetails | Nil

    # Describes whether StackSets automatically deploys to Organizations accounts that are added to a
    # target organization or organizational unit (OU). Valid only if the StackSet uses service-managed
    # permissions.
    property auto_deployment : AutoDeployment | Nil

    # Describes how the IAM roles required for StackSet operations are created.
    #
    # - With `self-managed` permissions, you must create the administrator and execution roles
    # required to deploy to target accounts. For more information, see [Grant self-managed
    # permissions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html).
    #
    # - With `service-managed` permissions, StackSets automatically creates the IAM roles required to
    # deploy to accounts managed by Organizations. For more information, see [Activate trusted access
    # for StackSets with
    # Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html).
    property permission_model : PermissionModels | Nil

    # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
    # specified for
    # [DeploymentTargets](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html).
    property organizational_unit_ids : Array(String) | Nil

    # Describes whether StackSets performs non-conflicting operations concurrently and queues
    # conflicting operations.
    property managed_execution : ManagedExecution | Nil

    # Returns a list of all Amazon Web Services Regions the given StackSet has stack instances
    # deployed in. The Amazon Web Services Regions list output is in no particular order.
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
