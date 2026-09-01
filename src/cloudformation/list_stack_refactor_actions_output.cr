private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListStackRefactorActionsOutput
    # The stack refactor actions.
    property stack_refactor_actions : Array(StackRefactorAction) = [] of StackRefactorAction

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call this action again and assign that token to the request
    # object's `NextToken` parameter. If the request returns all results, `NextToken` is set to
    # `null`.
    property next_token : String | Nil

    def initialize(
      @stack_refactor_actions : Array(StackRefactorAction),
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @stack_refactor_actions.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackRefactorActions.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_refactor_actions: node.xpath_nodes("*[local-name()='StackRefactorActions']/*[local-name()='member']").map { |n| StackRefactorAction.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @stack_refactor_actions
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stack_refactor_actions, @next_token)
  end
end
