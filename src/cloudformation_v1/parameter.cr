private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `Parameter` data type.
  class Parameter
    # The key associated with the parameter. If you don't specify a key and value for a particular
    # parameter, CloudFormation uses the default value that's specified in your template.
    property parameter_key : String | Nil

    # The input value associated with the parameter.
    property parameter_value : String | Nil

    # During a stack update, use the existing parameter value that the stack is using for a given
    # parameter key. If you specify `true`, do not specify a parameter value.
    property use_previous_value : Bool | Nil

    # Read-only. The value that corresponds to a Systems Manager parameter key. This field is returned
    # only for Systems Manager parameter types in the template. For more information, see [Specify
    # existing resources at runtime with CloudFormation-supplied parameter
    # types](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-supplied-parameter-types.html)
    # in the *CloudFormation User Guide*.
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

    def validate! : Nil
    end

    def_equals_and_hash(@parameter_key, @parameter_value, @use_previous_value, @resolved_value)
  end
end
