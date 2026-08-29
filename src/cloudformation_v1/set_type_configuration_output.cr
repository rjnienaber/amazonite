private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class SetTypeConfigurationOutput
    property configuration_arn : String | Nil

    def initialize(
      @configuration_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @configuration_arn
        params << {"#{prefix}ConfigurationArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        configuration_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ConfigurationArn']")),
      )
    end
  end
end
