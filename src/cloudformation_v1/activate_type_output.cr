private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ActivateTypeOutput
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
      )
    end
  end
end
