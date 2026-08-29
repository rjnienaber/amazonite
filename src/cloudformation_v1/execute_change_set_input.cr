private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ExecuteChangeSetInput
    property change_set_name : String

    property stack_name : String | Nil

    property client_request_token : String | Nil

    property disable_rollback : Bool | Nil

    property retain_except_on_create : Bool | Nil

    def initialize(
      @change_set_name : String,
      @stack_name : String | Nil = nil,
      @client_request_token : String | Nil = nil,
      @disable_rollback : Bool | Nil = nil,
      @retain_except_on_create : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      if value = @disable_rollback
        params << {"#{prefix}DisableRollback", Core::QueryValue.bool(value)}
      end

      if value = @retain_except_on_create
        params << {"#{prefix}RetainExceptOnCreate", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        disable_rollback: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableRollback']")),
        retain_except_on_create: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainExceptOnCreate']")),
      )
    end
  end
end
