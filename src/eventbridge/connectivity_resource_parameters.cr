private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # The parameters for EventBridge to use when invoking the resource endpoint.
  class ConnectivityResourceParameters
    include JSON::Serializable

    # The parameters for EventBridge to use when invoking the resource endpoint.
    @[JSON::Field(key: "ResourceParameters")]
    property resource_parameters : ConnectivityResourceConfigurationArn

    def initialize(
      @resource_parameters : ConnectivityResourceConfigurationArn,
    )
    end

    def validate! : Nil
      if value = @resource_parameters
        value.validate!
      end
    end

    def_equals_and_hash(@resource_parameters)
  end
end
