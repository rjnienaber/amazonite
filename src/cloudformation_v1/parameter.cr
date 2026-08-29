private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Parameter
    property parameter_key : String | Nil

    property parameter_value : String | Nil

    property use_previous_value : Bool | Nil

    property resolved_value : String | Nil

    def initialize(
      @parameter_key : String | Nil = nil,
      @parameter_value : String | Nil = nil,
      @use_previous_value : Bool | Nil = nil,
      @resolved_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @parameter_key
        params << {"#{prefix}ParameterKey", value}
      end

      if value = @parameter_value
        params << {"#{prefix}ParameterValue", value}
      end

      if value = @use_previous_value
        params << {"#{prefix}UsePreviousValue", Core::QueryValue.bool(value)}
      end

      if value = @resolved_value
        params << {"#{prefix}ResolvedValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parameter_key: Core::XMLValue.string(node.xpath_node("*[local-name()='ParameterKey']")),
        parameter_value: Core::XMLValue.string(node.xpath_node("*[local-name()='ParameterValue']")),
        use_previous_value: Core::XMLValue.bool(node.xpath_node("*[local-name()='UsePreviousValue']")),
        resolved_value: Core::XMLValue.string(node.xpath_node("*[local-name()='ResolvedValue']")),
      )
    end
  end
end
