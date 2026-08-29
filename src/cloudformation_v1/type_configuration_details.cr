private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TypeConfigurationDetails
    property arn : String | Nil

    property alias : String | Nil

    property configuration : String | Nil

    property last_updated : Time | Nil

    property type_arn : String | Nil

    property type_name : String | Nil

    property is_default_configuration : Bool | Nil

    def initialize(
      @arn : String | Nil = nil,
      @alias : String | Nil = nil,
      @configuration : String | Nil = nil,
      @last_updated : Time | Nil = nil,
      @type_arn : String | Nil = nil,
      @type_name : String | Nil = nil,
      @is_default_configuration : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @alias
        params << {"#{prefix}Alias", value}
      end

      if value = @configuration
        params << {"#{prefix}Configuration", value}
      end

      if value = @last_updated
        params << {"#{prefix}LastUpdated", Core::QueryValue.time(value)}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @is_default_configuration
        params << {"#{prefix}IsDefaultConfiguration", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        alias: Core::XMLValue.string(node.xpath_node("*[local-name()='Alias']")),
        configuration: Core::XMLValue.string(node.xpath_node("*[local-name()='Configuration']")),
        last_updated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdated']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        is_default_configuration: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsDefaultConfiguration']")),
      )
    end
  end
end
