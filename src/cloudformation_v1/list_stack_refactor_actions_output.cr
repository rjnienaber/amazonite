private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackRefactorActionsOutput
    property stack_refactor_actions : Array(StackRefactorAction) = [] of StackRefactorAction

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
  end
end
