private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ContinueUpdateRollbackInput
    property stack_name : String

    property role_arn : String | Nil

    property resources_to_skip : Array(String) | Nil

    property client_request_token : String | Nil

    def initialize(
      @stack_name : String,
      @role_arn : String | Nil = nil,
      @resources_to_skip : Array(String) | Nil = nil,
      @client_request_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @role_arn
        params << {"#{prefix}RoleARN", value}
      end

      (@resources_to_skip || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourcesToSkip.member.#{i}", item}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleARN']")),
        resources_to_skip: node.xpath_nodes("*[local-name()='ResourcesToSkip']/*[local-name()='member']").map { |n| n.content },
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
      )
    end
  end
end
