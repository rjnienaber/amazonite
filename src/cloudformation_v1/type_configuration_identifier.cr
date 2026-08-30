private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Identifying information for the configuration of a CloudFormation extension.
  class TypeConfigurationIdentifier
    # The ARN for the extension, in this account and Region.
    #
    # For public extensions, this will be the ARN assigned when you call the
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html)
    # API operation in this account and Region. For private extensions, this will be the ARN assigned
    # when you call the
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html)
    # API operation in this account and Region.
    property type_arn : String | Nil

    # The alias specified for this configuration, if one was specified when the configuration was set.
    property type_configuration_alias : String | Nil

    # The ARN for the configuration, in this account and Region.
    property type_configuration_arn : String | Nil

    # The type of extension.
    property type : ThirdPartyType | Nil

    # The name of the extension type to which this configuration applies.
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

    def validate! : Nil
      if value = @type_arn
        raise Core::ValidationError.new("TypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end

      if value = @type_configuration_alias
        raise Core::ValidationError.new("TypeConfigurationAlias length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeConfigurationAlias length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TypeConfigurationAlias does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9]{1,256}$"))
      end

      if value = @type_configuration_arn
        raise Core::ValidationError.new("TypeConfigurationArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeConfigurationArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeConfigurationArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type-configuration/.+$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end
    end

    def_equals_and_hash(@type_arn, @type_configuration_alias, @type_configuration_arn, @type, @type_name)
  end
end
