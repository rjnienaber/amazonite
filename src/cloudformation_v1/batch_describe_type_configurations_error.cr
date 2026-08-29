private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class BatchDescribeTypeConfigurationsError
    property error_code : String | Nil

    property error_message : String | Nil

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
  end
end
