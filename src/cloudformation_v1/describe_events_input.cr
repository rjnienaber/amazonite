private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeEventsInput
    # The name or unique stack ID for which you want to retrieve events. If you specified the name of
    # a change set, specify the stack name or ID (ARN) of the change set you want to describe.
    property stack_name : String | Nil

    # The name or Amazon Resource Name (ARN) of the change set for which you want to retrieve events.
    property change_set_name : String | Nil

    # The unique identifier of the operation for which you want to retrieve events.
    property operation_id : String | Nil

    # Filters to apply when retrieving events.
    property filters : EventFilter | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    def initialize(
      @stack_name : String | Nil = nil,
      @change_set_name : String | Nil = nil,
      @operation_id : String | Nil = nil,
      @filters : EventFilter | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @change_set_name
        params << {"#{prefix}ChangeSetName", value}
      end

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      if value = @filters
        params.concat(value.to_query_params("#{prefix}Filters."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")),
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        filters: node.xpath_node("*[local-name()='Filters']").try { |n| EventFilter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
