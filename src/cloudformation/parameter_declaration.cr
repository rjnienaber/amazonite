private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The `ParameterDeclaration` data type.
  class ParameterDeclaration
    # The name that's associated with the parameter.
    property parameter_key : String | Nil

    # The default value of the parameter.
    property default_value : String | Nil

    # The type of parameter.
    property parameter_type : String | Nil

    # Flag that indicates whether the parameter value is shown as plain text in logs and in the Amazon
    # Web Services Management Console.
    property no_echo : Bool | Nil

    # The description that's associate with the parameter.
    property description : String | Nil

    # The criteria that CloudFormation uses to validate parameter values.
    property parameter_constraints : ParameterConstraints | Nil

    def initialize(
      @parameter_key : String | Nil = nil,
      @default_value : String | Nil = nil,
      @parameter_type : String | Nil = nil,
      @no_echo : Bool | Nil = nil,
      @description : String | Nil = nil,
      @parameter_constraints : ParameterConstraints | Nil = nil,
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

      if value = @parameter_type
        params << {"#{prefix}ParameterType", value}
      end

      if value = @no_echo
        params << {"#{prefix}NoEcho", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @parameter_constraints
        params.concat(value.to_query_params("#{prefix}ParameterConstraints."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parameter_key: Core::XMLValue.string(node.xpath_node("*[local-name()='ParameterKey']")),
        default_value: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultValue']")),
        parameter_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ParameterType']")),
        no_echo: Core::XMLValue.bool(node.xpath_node("*[local-name()='NoEcho']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        parameter_constraints: node.xpath_node("*[local-name()='ParameterConstraints']").try { |n| ParameterConstraints.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @parameter_constraints
        value.validate!
      end
    end

    def_equals_and_hash(@parameter_key, @default_value, @parameter_type, @no_echo, @description, @parameter_constraints)
  end
end
