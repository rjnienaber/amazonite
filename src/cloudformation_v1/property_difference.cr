private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class PropertyDifference
    property property_path : String

    property expected_value : String

    property actual_value : String

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
  end
end
