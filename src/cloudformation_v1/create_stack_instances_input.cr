private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateStackInstancesInput
    # The name or unique ID of the StackSet that you want to create stack instances from.
    property stack_set_name : String

    # [Self-managed permissions] The account IDs of one or more Amazon Web Services accounts that you
    # want to create stack instances in the specified Region(s) for.
    #
    # You can specify `Accounts` or `DeploymentTargets`, but not both.
    property accounts : Array(String) | Nil

    # [Service-managed permissions] The Organizations accounts in which to create stack instances in
    # the specified Amazon Web Services Regions.
    #
    # You can specify `Accounts` or `DeploymentTargets`, but not both.
    property deployment_targets : DeploymentTargets | Nil

    # The names of one or more Amazon Web Services Regions where you want to create stack instances
    # using the specified Amazon Web Services accounts.
    property regions : Array(String) = [] of String

    # A list of StackSet parameters whose values you want to override in the selected stack instances.
    #
    # Any overridden parameter values will be applied to all stack instances in the specified accounts
    # and Amazon Web Services Regions. When specifying parameters and their values, be aware of how
    # CloudFormation sets parameter values during stack instance operations:
    #
    # - To override the current value for a parameter, include the parameter and specify its value.
    #
    # - To leave an overridden parameter set to its present value, include the parameter and specify
    # `UsePreviousValue` as `true`. (You can't specify both a value and set `UsePreviousValue` to
    # `true`.)
    #
    # - To set an overridden parameter back to the value specified in the StackSet, specify a
    # parameter list but don't include the parameter in the list.
    #
    # - To leave all parameters set to their present values, don't specify this property at all.
    #
    # During StackSet updates, any parameter values overridden for a stack instance aren't updated,
    # but retain their overridden value.
    #
    # You can only override the parameter *values* that are specified in the StackSet; to add or
    # delete a parameter itself, use
    # [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
    # to update the StackSet template.
    property parameter_overrides : Array(Parameter) | Nil

    # Preferences for how CloudFormation performs this StackSet operation.
    property operation_preferences : StackSetOperationPreferences | Nil

    # The unique identifier for this StackSet operation.
    #
    # The operation ID also functions as an idempotency token, to ensure that CloudFormation performs
    # the StackSet operation only once, even if you retry the request multiple times. You might retry
    # StackSet operation requests to ensure that CloudFormation successfully received them.
    #
    # If you don't specify an operation ID, the SDK generates one automatically.
    #
    # Repeating this StackSet operation with a new operation ID retries all stack instances whose
    # status is `OUTDATED`.
    property operation_id : String | Nil

    # [Service-managed permissions] Specifies whether you are acting as an account administrator in
    # the organization's management account or as a delegated administrator in a member account.
    #
    # By default, `SELF` is specified. Use `SELF` for StackSets with self-managed permissions.
    #
    # - If you are signed in to the management account, specify `SELF`.
    #
    # - If you are signed in to a delegated administrator account, specify `DELEGATED_ADMIN`.
    #
    # Your Amazon Web Services account must be registered as a delegated administrator in the
    # management account. For more information, see [Register a delegated
    # administrator](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html)
    # in the *CloudFormation User Guide*.
    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @regions : Array(String),
      @accounts : Array(String) | Nil = nil,
      @deployment_targets : DeploymentTargets | Nil = nil,
      @parameter_overrides : Array(Parameter) | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
      @operation_id : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      (@accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Accounts.member.#{i}", item}
      end

      if value = @deployment_targets
        params.concat(value.to_query_params("#{prefix}DeploymentTargets."))
      end

      @regions.each_with_index(1) do |item, i|
        params << {"#{prefix}Regions.member.#{i}", item}
      end

      (@parameter_overrides || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ParameterOverrides.member.#{i}."))
      end

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        accounts: node.xpath_nodes("*[local-name()='Accounts']/*[local-name()='member']").map { |n| n.content },
        deployment_targets: node.xpath_node("*[local-name()='DeploymentTargets']").try { |n| DeploymentTargets.from_xml(n) },
        regions: node.xpath_nodes("*[local-name()='Regions']/*[local-name()='member']").map { |n| n.content },
        parameter_overrides: node.xpath_nodes("*[local-name()='ParameterOverrides']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@stack_set_name, @accounts, @deployment_targets, @regions, @parameter_overrides, @operation_preferences, @operation_id, @call_as)
  end
end
