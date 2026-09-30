private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # If the connection uses a private OAuth endpoint, the parameters for EventBridge to use when
  # authenticating against the endpoint.
  #
  # For more information, see [Authorization methods for
  # connections](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html)
  # in the * *Amazon EventBridge User Guide* *.
  class DescribeConnectionConnectivityParameters
    include JSON::Serializable

    # The parameters for EventBridge to use when invoking the resource endpoint.
    @[JSON::Field(key: "ResourceParameters")]
    property resource_parameters : DescribeConnectionResourceParameters

    def initialize(
      @resource_parameters : DescribeConnectionResourceParameters,
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
