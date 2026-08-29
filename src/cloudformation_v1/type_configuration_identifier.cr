private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TypeConfigurationIdentifier
    property type_arn : String | Nil

    property type_configuration_alias : String | Nil

    property type_configuration_arn : String | Nil

    property type : ThirdPartyType | Nil

    property type_name : String | Nil

    def initialize(
      @type_arn : String | Nil = nil,
      @type_configuration_alias : String | Nil = nil,
      @type_configuration_arn : String | Nil = nil,
      @type : ThirdPartyType | Nil = nil,
      @type_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @type_configuration_alias
        params << {"#{prefix}TypeConfigurationAlias", value}
      end

      if value = @type_configuration_arn
        params << {"#{prefix}TypeConfigurationArn", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        type_configuration_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeConfigurationAlias']")),
        type_configuration_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeConfigurationArn']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
      )
    end
  end
end
