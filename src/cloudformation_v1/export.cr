private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `Export` structure describes the exported output values for a stack.
  #
  # For more information, see [Get exported outputs from a deployed CloudFormation
  # stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html).
  class Export
    # The stack that contains the exported output name and value.
    property exporting_stack_id : String | Nil

    # The name of exported output value. Use this name and the `Fn::ImportValue` function to import
    # the associated value into other stacks. The name is defined in the `Export` field in the
    # associated stack's `Outputs` section.
    property name : String | Nil

    # The value of the exported output, such as a resource physical ID. This value is defined in the
    # `Export` field in the associated stack's `Outputs` section.
    property value : String | Nil

    def initialize(
      @exporting_stack_id : String | Nil = nil,
      @name : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @exporting_stack_id
        params << {"#{prefix}ExportingStackId", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        exporting_stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ExportingStackId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end

    def_equals_and_hash(@exporting_stack_id, @name, @value)
  end
end
