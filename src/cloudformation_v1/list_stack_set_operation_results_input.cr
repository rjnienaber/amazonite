private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackSetOperationResultsInput
    # The name or unique ID of the StackSet that you want to get operation results for.
    property stack_set_name : String

    # The ID of the StackSet operation.
    property operation_id : String

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
    property max_results : Int32 | Nil

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

    # The filter to apply to operation results.
    property filters : Array(OperationResultFilter) | Nil

    def initialize(
      @stack_set_name : String,
      @operation_id : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @call_as : CallAs | Nil = nil,
      @filters : Array(OperationResultFilter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      params << {"#{prefix}OperationId", @operation_id}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end

      (@filters || [] of OperationResultFilter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filters.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
        filters: node.xpath_nodes("*[local-name()='Filters']/*[local-name()='member']").map { |n| OperationResultFilter.from_xml(n) },
      )
    end

    def_equals_and_hash(@stack_set_name, @operation_id, @next_token, @max_results, @call_as, @filters)
  end
end
