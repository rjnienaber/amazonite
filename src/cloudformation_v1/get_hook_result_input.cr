private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetHookResultInput
    property hook_result_id : String | Nil

    def initialize(
      @hook_result_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @hook_result_id
        params << {"#{prefix}HookResultId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hook_result_id: Core::XMLValue.string(node.xpath_node("*[local-name()='HookResultId']")),
      )
    end
  end
end
