module Amazonite::LambdaV1
  class CapacityProviderConfig
    include JSON::Serializable

    @[JSON::Field(key: "LambdaManagedInstancesCapacityProviderConfig")]
    property lambda_managed_instances_capacity_provider_config : LambdaManagedInstancesCapacityProviderConfig

    def initialize(
      @lambda_managed_instances_capacity_provider_config : LambdaManagedInstancesCapacityProviderConfig,
    )
    end
  end
end
