private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Detailed information concerning an error generated during the setting of configuration data for
  # a CloudFormation extension.
  class BatchDescribeTypeConfigurationsError
    # The error code.
    property error_code : String | Nil

    # The error message.
    property error_message : String | Nil

    # Identifying information for the configuration of a CloudFormation extension.
    property type_configuration_identifier : TypeConfigurationIdentifier | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
      @type_configuration_identifier : TypeConfigurationIdentifier | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @error_code
        params << {"#{prefix}ErrorCode", value}
      end

      if value = @error_message
        params << {"#{prefix}ErrorMessage", value}
      end

      if value = @type_configuration_identifier
        params.concat(value.to_query_params("#{prefix}TypeConfigurationIdentifier."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error_code: Core::XMLValue.string(node.xpath_node("*[local-name()='ErrorCode']")),
        error_message: Core::XMLValue.string(node.xpath_node("*[local-name()='ErrorMessage']")),
        type_configuration_identifier: node.xpath_node("*[local-name()='TypeConfigurationIdentifier']").try { |n| TypeConfigurationIdentifier.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @error_code
        raise Core::ValidationError.new("ErrorCode length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("ErrorCode length must be <= 3") if value.size > 3
      end

      if value = @error_message
        raise Core::ValidationError.new("ErrorMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ErrorMessage length must be <= 255") if value.size > 255
      end

      if value = @type_configuration_identifier
        value.validate!
      end
    end

    def_equals_and_hash(@error_code, @error_message, @type_configuration_identifier)
  end
end
