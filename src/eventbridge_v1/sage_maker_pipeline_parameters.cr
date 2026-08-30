private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # These are custom parameters to use when the target is a SageMaker AI Model Building Pipeline
  # that starts based on EventBridge events.
  class SageMakerPipelineParameters
    include JSON::Serializable

    # List of Parameter names and values for SageMaker AI Model Building Pipeline execution.
    @[JSON::Field(key: "PipelineParameterList")]
    property pipeline_parameter_list : Array(SageMakerPipelineParameter) | Nil

    def initialize(
      @pipeline_parameter_list : Array(SageMakerPipelineParameter) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @pipeline_parameter_list
        raise Core::ValidationError.new("PipelineParameterList must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("PipelineParameterList must have at most 200 item(s)") if value.size > 200
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@pipeline_parameter_list)
  end
end
