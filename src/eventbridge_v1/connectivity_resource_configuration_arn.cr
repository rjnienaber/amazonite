private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_configuration_arn
        raise Core::ValidationError.new("ResourceConfigurationArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ResourceConfigurationArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ResourceConfigurationArn does not match the required pattern") unless value.matches?(Regex.new("^(?:^arn:[a-z0-9\\-]+:vpc-lattice:[a-zA-Z0-9\\-]+:\\d{12}:resourceconfiguration/rcfg-[0-9a-z]{17}$|^$)$"))
      end
    end

    def_equals_and_hash(@resource_configuration_arn)
  end
end
