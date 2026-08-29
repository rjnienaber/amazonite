private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeEventsInput
    property stack_name : String | Nil

    property change_set_name : String | Nil

    property operation_id : String | Nil

    property filters : EventFilter | Nil

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
