private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetFlowLogsIntegrationTemplateResult
    # The generated CloudFormation template.
    property result : String | Nil

    def initialize(
      @result : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @result
        params << {"#{prefix}Result", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        result: Core::XMLValue.string(node.xpath_node("*[local-name()='result']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@result)
  end
end
