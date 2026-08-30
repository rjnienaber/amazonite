private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class SetTypeConfigurationOutput
    # The Amazon Resource Name (ARN) for the configuration data in this account and Region.
    #
    # Conditional: You must specify `ConfigurationArn`, or `Type` and `TypeName`.
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

    def validate! : Nil
      if value = @configuration_arn
        raise Core::ValidationError.new("ConfigurationArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ConfigurationArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("ConfigurationArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type-configuration/.+$"))
      end
    end

    def_equals_and_hash(@configuration_arn)
  end
end
