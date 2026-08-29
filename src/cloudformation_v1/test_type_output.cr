private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TestTypeOutput
    property type_version_arn : String | Nil

    def initialize(
      @type_version_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_version_arn
        params << {"#{prefix}TypeVersionArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_version_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeVersionArn']")),
      )
    end
  end
end
