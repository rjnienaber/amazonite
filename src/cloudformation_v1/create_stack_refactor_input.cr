private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateStackRefactorInput
    # A description to help you identify the stack refactor.
    property description : String | Nil

    # Determines if a new stack is created with the refactor.
    property enable_stack_creation : Bool | Nil

    # The mappings for the stack resource `Source` and stack resource `Destination`.
    property resource_mappings : Array(ResourceMapping) | Nil

    # The stacks being refactored.
    property stack_definitions : Array(StackDefinition) = [] of StackDefinition

    def initialize(
      @stack_definitions : Array(StackDefinition),
      @description : String | Nil = nil,
      @enable_stack_creation : Bool | Nil = nil,
      @resource_mappings : Array(ResourceMapping) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @enable_stack_creation
        params << {"#{prefix}EnableStackCreation", Core::QueryValue.bool(value)}
      end

      (@resource_mappings || [] of ResourceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceMappings.member.#{i}."))
      end

      @stack_definitions.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackDefinitions.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        enable_stack_creation: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableStackCreation']")),
        resource_mappings: node.xpath_nodes("*[local-name()='ResourceMappings']/*[local-name()='member']").map { |n| ResourceMapping.from_xml(n) },
        stack_definitions: node.xpath_nodes("*[local-name()='StackDefinitions']/*[local-name()='member']").map { |n| StackDefinition.from_xml(n) },
      )
    end

    def_equals_and_hash(@description, @enable_stack_creation, @resource_mappings, @stack_definitions)
  end
end
