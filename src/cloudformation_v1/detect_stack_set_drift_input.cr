private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DetectStackSetDriftInput
    # The name of the StackSet on which to perform the drift detection operation.
    property stack_set_name : String

    # The user-specified preferences for how CloudFormation performs a StackSet operation.
    #
    # For more information about maximum concurrent accounts and failure tolerance, see [StackSet
    # operation
    # options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
    property operation_preferences : StackSetOperationPreferences | Nil

    # *The ID of the StackSet operation.*
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
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
      @operation_id : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

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
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@stack_set_name, @operation_preferences, @operation_id, @call_as)
  end
end
