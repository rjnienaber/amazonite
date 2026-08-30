private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Detailed information concerning the specification of a CloudFormation extension in a given
  # account and Region.
  #
  # For more information, see [Edit configuration data for extensions in your
  # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html)
  # in the *CloudFormation User Guide*.
  class TypeConfigurationDetails
    # The ARN for the configuration data, in this account and Region.
    property arn : String | Nil

    # The alias specified for this configuration, if one was specified when the configuration was set.
    property alias : String | Nil

    # A JSON string specifying the configuration data for the extension, in this account and Region.
    #
    # If a configuration hasn't been set for a specified extension, CloudFormation returns `{}`.
    property configuration : String | Nil

    # When the configuration data was last updated for this extension.
    #
    # If a configuration hasn't been set for a specified extension, CloudFormation returns `null`.
    property last_updated : Time | Nil

    # The ARN for the extension, in this account and Region.
    #
    # For public extensions, this will be the ARN assigned when you call the
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html)
    # API operation in this account and Region. For private extensions, this will be the ARN assigned
    # when you call the
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html)
    # API operation in this account and Region.
    property type_arn : String | Nil

    # The name of the extension.
    property type_name : String | Nil

    # Whether this configuration data is the default configuration for the extension.
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

    def_equals_and_hash(@arn, @alias, @configuration, @last_updated, @type_arn, @type_name, @is_default_configuration)
  end
end
