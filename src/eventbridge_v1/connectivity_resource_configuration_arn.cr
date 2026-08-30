module Amazonite::EventBridgeV1
  # The Amazon Resource Name (ARN) of the Amazon VPC Lattice resource configuration for the resource
  # endpoint.
  class ConnectivityResourceConfigurationArn
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Amazon VPC Lattice resource configuration for the resource
    # endpoint.
    @[JSON::Field(key: "ResourceConfigurationArn")]
    property resource_configuration_arn : String

    def initialize(
      @resource_configuration_arn : String,
    )
    end

    def_equals_and_hash(@resource_configuration_arn)
  end
end
