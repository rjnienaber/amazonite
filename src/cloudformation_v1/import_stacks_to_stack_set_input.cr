private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ImportStacksToStackSetInput
    property stack_set_name : String

    property stack_ids : Array(String) | Nil

    property stack_ids_url : String | Nil

    property organizational_unit_ids : Array(String) | Nil

    property operation_preferences : StackSetOperationPreferences | Nil

    property operation_id : String | Nil

    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @stack_ids : Array(String) | Nil = nil,
      @stack_ids_url : String | Nil = nil,
      @organizational_unit_ids : Array(String) | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
      @operation_id : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      (@stack_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}StackIds.member.#{i}", item}
      end

      if value = @stack_ids_url
        params << {"#{prefix}StackIdsUrl", value}
      end

      (@organizational_unit_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OrganizationalUnitIds.member.#{i}", item}
      end

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
        stack_ids: node.xpath_nodes("*[local-name()='StackIds']/*[local-name()='member']").map { |n| n.content },
        stack_ids_url: Core::XMLValue.string(node.xpath_node("*[local-name()='StackIdsUrl']")),
        organizational_unit_ids: node.xpath_nodes("*[local-name()='OrganizationalUnitIds']/*[local-name()='member']").map { |n| n.content },
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
