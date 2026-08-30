private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"))
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@name, @value)
  end
end
