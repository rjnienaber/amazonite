private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `TemplateParameter` data type.
  class TemplateParameter
    # The name associated with the parameter.
    property parameter_key : String | Nil

    # The default value associated with the parameter.
    property default_value : String | Nil

    # Flag indicating whether the parameter should be displayed as plain text in logs and UIs.
    property no_echo : Bool | Nil

    # User defined description associated with the parameter.
    property description : String | Nil

    def initialize(
      @parameter_key : String | Nil = nil,
      @default_value : String | Nil = nil,
      @no_echo : Bool | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @parameter_key
        params << {"#{prefix}ParameterKey", value}
      end

      if value = @default_value
        params << {"#{prefix}DefaultValue", value}
      end

      if value = @no_echo
        params << {"#{prefix}NoEcho", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parameter_key: Core::XMLValue.string(node.xpath_node("*[local-name()='ParameterKey']")),
        default_value: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultValue']")),
        no_echo: Core::XMLValue.bool(node.xpath_node("*[local-name()='NoEcho']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end

    def_equals_and_hash(@parameter_key, @default_value, @no_echo, @description)
  end
end
