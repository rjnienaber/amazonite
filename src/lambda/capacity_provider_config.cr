private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Configuration for the capacity provider that manages compute resources for Lambda functions.
  class CapacityProviderConfig
    include JSON::Serializable

    # Configuration for Lambda-managed instances used by the capacity provider.
    @[JSON::Field(key: "LambdaManagedInstancesCapacityProviderConfig")]
    property lambda_managed_instances_capacity_provider_config : LambdaManagedInstancesCapacityProviderConfig

    def initialize(
      @lambda_managed_instances_capacity_provider_config : LambdaManagedInstancesCapacityProviderConfig,
    )
    end

    def validate! : Nil
      if value = @lambda_managed_instances_capacity_provider_config
        value.validate!
      end
    end

    def_equals_and_hash(@lambda_managed_instances_capacity_provider_config)
  end
end
