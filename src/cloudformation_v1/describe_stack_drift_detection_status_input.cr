private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackDriftDetectionStatusInput
    property stack_drift_detection_id : String

    def initialize(
      @stack_drift_detection_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackDriftDetectionId", @stack_drift_detection_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_drift_detection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackDriftDetectionId']")).not_nil!,
      )
    end
  end
end
