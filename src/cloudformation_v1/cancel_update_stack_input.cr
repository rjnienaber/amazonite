private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CancelUpdateStackInput
    property stack_name : String

    property client_request_token : String | Nil

    def initialize(
      @stack_name : String,
      @client_request_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
      )
    end
  end
end
