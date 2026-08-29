private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ImportStacksToStackSetInput
    # The name of the StackSet. The name must be unique in the Region where you create your StackSet.
    property stack_set_name : String

    # The IDs of the stacks you are importing into a StackSet. You import up to 10 stacks per StackSet
    # at a time.
    #
    # Specify either `StackIds` or `StackIdsUrl`.
    property stack_ids : Array(String) | Nil

    # The Amazon S3 URL which contains list of stack ids to be inputted.
    #
    # Specify either `StackIds` or `StackIdsUrl`.
    property stack_ids_url : String | Nil

    # The list of OU ID's to which the imported stacks must be mapped as deployment targets.
    property organizational_unit_ids : Array(String) | Nil

    # The user-specified preferences for how CloudFormation performs a StackSet operation.
    #
    # For more information about maximum concurrent accounts and failure tolerance, see [StackSet
    # operation
    # options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
    property operation_preferences : StackSetOperationPreferences | Nil

    # A unique, user defined, identifier for the StackSet operation.
    property operation_id : String | Nil

    # By default, `SELF` is specified. Use `SELF` for StackSets with self-managed permissions.
    #
    # - If you are signed in to the management account, specify `SELF`.
    #
    # - For service managed StackSets, specify `DELEGATED_ADMIN`.
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
