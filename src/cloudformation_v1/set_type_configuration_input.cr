private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class SetTypeConfigurationInput
    # The Amazon Resource Name (ARN) for the extension in this account and Region.
    #
    # For public extensions, this will be the ARN assigned when you call the
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html)
    # API operation in this account and Region. For private extensions, this will be the ARN assigned
    # when you call the
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html)
    # API operation in this account and Region.
    #
    # Do not include the extension versions suffix at the end of the ARN. You can set the
    # configuration for an extension, but not for a specific extension version.
    property type_arn : String | Nil

    # The configuration data for the extension in this account and Region.
    #
    # The configuration data must be formatted as JSON and validate against the extension's schema
    # returned in the `Schema` response element of
    # [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html).
    property configuration : String

    # An alias by which to refer to this extension configuration data.
    #
    # Conditional: Specifying a configuration alias is required when setting a configuration for a
    # resource type extension.
    property configuration_alias : String | Nil

    # The name of the extension.
    #
    # Conditional: You must specify `ConfigurationArn`, or `Type` and `TypeName`.
    property type_name : String | Nil

    # The type of extension.
    #
    # Conditional: You must specify `ConfigurationArn`, or `Type` and `TypeName`.
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
