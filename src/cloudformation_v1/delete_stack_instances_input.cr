private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeleteStackInstancesInput
    property stack_set_name : String

    property accounts : Array(String) | Nil

    property deployment_targets : DeploymentTargets | Nil

    property regions : Array(String) = [] of String

    property operation_preferences : StackSetOperationPreferences | Nil

    property retain_stacks : Bool

    property operation_id : String | Nil

    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @regions : Array(String),
      @retain_stacks : Bool,
      @accounts : Array(String) | Nil = nil,
      @deployment_targets : DeploymentTargets | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
      @operation_id : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      (@accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Accounts.member.#{i}", item}
      end

      if value = @deployment_targets
        params.concat(value.to_query_params("#{prefix}DeploymentTargets."))
      end

      @regions.each_with_index(1) do |item, i|
        params << {"#{prefix}Regions.member.#{i}", item}
      end

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end

      params << {"#{prefix}RetainStacks", Core::QueryValue.bool(@retain_stacks)}

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
        accounts: node.xpath_nodes("*[local-name()='Accounts']/*[local-name()='member']").map { |n| n.content },
        deployment_targets: node.xpath_node("*[local-name()='DeploymentTargets']").try { |n| DeploymentTargets.from_xml(n) },
        regions: node.xpath_nodes("*[local-name()='Regions']/*[local-name()='member']").map { |n| n.content },
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        retain_stacks: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainStacks']")).not_nil!,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
