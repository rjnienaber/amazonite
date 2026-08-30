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

    def validate! : Nil
      if value = @type_arn
        raise Core::ValidationError.new("TypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end

      if value = @configuration
        raise Core::ValidationError.new("Configuration length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Configuration length must be <= 204800") if value.size > 204800
        raise Core::ValidationError.new("Configuration does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]+$"))
      end

      if value = @configuration_alias
        raise Core::ValidationError.new("ConfigurationAlias length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConfigurationAlias length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ConfigurationAlias does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9]{1,256}$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end
    end

    def_equals_and_hash(@type_arn, @configuration, @configuration_alias, @type_name, @type)
  end
end
