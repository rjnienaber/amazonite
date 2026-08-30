module Amazonite::EventBridgeV1
  # Name/Value pair of a parameter to start execution of a SageMaker AI Model Building Pipeline.
  class SageMakerPipelineParameter
    include JSON::Serializable

    # Name of parameter to start execution of a SageMaker AI Model Building Pipeline.
    @[JSON::Field(key: "Name")]
    property name : String

    # Value of parameter to start execution of a SageMaker AI Model Building Pipeline.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @name : String,
      @value : String,
    )
    end

    def_equals_and_hash(@name, @value)
  end
end
