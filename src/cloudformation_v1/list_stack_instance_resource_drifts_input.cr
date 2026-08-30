private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackInstanceResourceDriftsInput
    # The name or unique ID of the StackSet that you want to list drifted resources for.
    property stack_set_name : String

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
    property max_results : Int32 | Nil

    # The resource drift status of the stack instance.
    #
    # - `DELETED`: The resource differs from its expected template configuration in that the resource
    # has been deleted.
    #
    # - `MODIFIED`: One or more resource properties differ from their expected template values.
    #
    # - `IN_SYNC`: The resource's actual configuration matches its expected template configuration.
    #
    # - `NOT_CHECKED`: CloudFormation doesn't currently return this value.
    property stack_instance_resource_drift_statuses : Array(StackResourceDriftStatus) | Nil

    # The name of the Amazon Web Services account that you want to list resource drifts for.
    property stack_instance_account : String

    # The name of the Region where you want to list resource drifts.
    property stack_instance_region : String

    # The unique ID of the drift operation.
    property operation_id : String

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
