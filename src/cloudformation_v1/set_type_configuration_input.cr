private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class SetTypeConfigurationInput
    property type_arn : String | Nil

    property configuration : String

    property configuration_alias : String | Nil

    property type_name : String | Nil

    property type : ThirdPartyType | Nil

    def initialize(
      @configuration : String,
      @type_arn : String | Nil = nil,
      @configuration_alias : String | Nil = nil,
      @type_name : String | Nil = nil,
      @type : ThirdPartyType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      params << {"#{prefix}Configuration", @configuration}

      if value = @configuration_alias
        params << {"#{prefix}ConfigurationAlias", value}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        configuration: Core::XMLValue.string(node.xpath_node("*[local-name()='Configuration']")).not_nil!,
        configuration_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='ConfigurationAlias']")),
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
