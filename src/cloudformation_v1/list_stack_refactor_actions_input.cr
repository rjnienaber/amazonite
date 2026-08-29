private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackRefactorActionsInput
    property stack_refactor_id : String

    property next_token : String | Nil

    property max_results : Int32 | Nil

    def initialize(
      @stack_refactor_id : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackRefactorId", @stack_refactor_id}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_refactor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackRefactorId']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end
  end
end
