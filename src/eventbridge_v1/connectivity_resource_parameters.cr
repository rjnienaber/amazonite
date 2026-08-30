module Amazonite::EventBridgeV1
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
  end
end
