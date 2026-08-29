module Amazonite::LambdaV1
  class CapacityProviderPermissionsConfig
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviderOperatorRoleArn")]
    property capacity_provider_operator_role_arn : String

    def initialize(
      @capacity_provider_operator_role_arn : String,
    )
    end
  end
end
