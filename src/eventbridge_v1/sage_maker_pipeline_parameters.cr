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
  end
end
