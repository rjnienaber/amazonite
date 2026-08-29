private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Defines a parameter that a role template accepts. You supply values for these parameters when
  # you create a role with
  # [AcquireRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AcquireRole.html).
  class ParameterDefinition
    # The name of the parameter.
    property name : String

    # The data type of the parameter. Valid values are `String`, `StringList`, `Number`, `NumberList`,
    # `Arn`, and `ArnList`.
    property type : ParameterTypeType

    # An optional subtype that further constrains the values that are allowed for the parameter.
    property sub_type : String | Nil

    # A description of the parameter.
    property description : String | Nil

    # Specifies whether you must supply a value for the parameter when you create a role from the
    # template.
    property is_required : Bool | Nil

    # The value that the service uses for the parameter when you do not supply one.
    property default_value : String | Nil

    # Specifies whether you can change the parameter value after you create the role.
    property immutable : Bool | Nil

    def initialize(
      @name : String,
      @type : ParameterTypeType,
      @sub_type : String | Nil = nil,
      @description : String | Nil = nil,
      @is_required : Bool | Nil = nil,
      @default_value : String | Nil = nil,
      @immutable : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Name", @name}

      params << {"#{prefix}Type", @type.to_json_object_key}

      if value = @sub_type
        params << {"#{prefix}SubType", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @is_required
        params << {"#{prefix}IsRequired", Core::QueryValue.bool(value)}
      end

      if value = @default_value
        params << {"#{prefix}DefaultValue", value}
      end

      if value = @immutable
        params << {"#{prefix}Immutable", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AI::ParameterTypeType.from_json_object_key?(n.content) : nil.not_nil!,
        sub_type: Core::XMLValue.string(node.xpath_node("*[local-name()='SubType']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        is_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsRequired']")),
        default_value: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultValue']")),
        immutable: Core::XMLValue.bool(node.xpath_node("*[local-name()='Immutable']")),
      )
    end
  end
end
