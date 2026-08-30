private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Information about a resource property whose actual value differs from its expected value, as
  # defined in the stack template and any values specified as template parameters. These will be
  # present only for resources whose `StackResourceDriftStatus` is `MODIFIED`. For more information,
  # see [Detect unmanaged configuration changes to stacks and resources with drift
  # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  class PropertyDifference
    # The fully-qualified path to the resource property.
    property property_path : String

    # The expected property value of the resource property, as defined in the stack template and any
    # values specified as template parameters.
    property expected_value : String

    # The actual property value of the resource property.
    property actual_value : String

    # The type of property difference.
    #
    # - `ADD`: A value has been added to a resource property that's an array or list data type.
    #
    # - `REMOVE`: The property has been removed from the current resource configuration.
    #
    # - `NOT_EQUAL`: The current property value differs from its expected value (as defined in the
    # stack template and any values specified as template parameters).
    property difference_type : DifferenceType

    def initialize(
      @property_path : String,
      @expected_value : String,
      @actual_value : String,
      @difference_type : DifferenceType,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PropertyPath", @property_path}

      params << {"#{prefix}ExpectedValue", @expected_value}

      params << {"#{prefix}ActualValue", @actual_value}

      params << {"#{prefix}DifferenceType", @difference_type.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        property_path: Core::XMLValue.string(node.xpath_node("*[local-name()='PropertyPath']")).not_nil!,
        expected_value: Core::XMLValue.string(node.xpath_node("*[local-name()='ExpectedValue']")).not_nil!,
        actual_value: Core::XMLValue.string(node.xpath_node("*[local-name()='ActualValue']")).not_nil!,
        difference_type: ((n = node.xpath_node("*[local-name()='DifferenceType']")) ? ACF::DifferenceType.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@property_path, @expected_value, @actual_value, @difference_type)
  end
end
