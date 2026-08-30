private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeleteStackInstancesInput
    # The name or unique ID of the StackSet that you want to delete stack instances for.
    property stack_set_name : String

    # [Self-managed permissions] The account IDs of the Amazon Web Services accounts that you want to
    # delete stack instances for.
    #
    # You can specify `Accounts` or `DeploymentTargets`, but not both.
    property accounts : Array(String) | Nil

    # [Service-managed permissions] The Organizations accounts from which to delete stack instances.
    #
    # You can specify `Accounts` or `DeploymentTargets`, but not both.
    property deployment_targets : DeploymentTargets | Nil

    # The Amazon Web Services Regions where you want to delete StackSet instances.
    property regions : Array(String) = [] of String

    # Preferences for how CloudFormation performs this StackSet operation.
    property operation_preferences : StackSetOperationPreferences | Nil

    # Removes the stack instances from the specified StackSet, but doesn't delete the stacks. You
    # can't reassociate a retained stack or add an existing, saved stack to a new stack set.
    #
    # For more information, see [StackSet operation
    # options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
    property retain_stacks : Bool

    # The unique identifier for this StackSet operation.
    #
    # If you don't specify an operation ID, the SDK generates one automatically.
    #
    # The operation ID also functions as an idempotency token, to ensure that CloudFormation performs
    # the StackSet operation only once, even if you retry the request multiple times. You can retry
    # StackSet operation requests to ensure that CloudFormation successfully received them.
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
      @retain_stacks : Bool,
      @accounts : Array(String) | Nil = nil,
      @deployment_targets : DeploymentTargets | Nil = nil,
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

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end

      params << {"#{prefix}RetainStacks", Core::QueryValue.bool(@retain_stacks)}

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
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        retain_stacks: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainStacks']")).not_nil!,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@stack_set_name, @accounts, @deployment_targets, @regions, @operation_preferences, @retain_stacks, @operation_id, @call_as)
  end
end
