private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DetectStackDriftOutput
    # The ID of the drift detection results of this operation.
    #
    # CloudFormation generates new results, with a new drift detection ID, each time this operation is
    # run. However, the number of drift results CloudFormation retains for any given stack, and for
    # how long, may vary.
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

    def validate! : Nil
      if value = @stack_drift_detection_id
        raise Core::ValidationError.new("StackDriftDetectionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackDriftDetectionId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@stack_drift_detection_id)
  end
end
