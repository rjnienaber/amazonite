module Amazonite::LambdaV1
  # Configuration that specifies the permissions required for the capacity provider to manage
  # compute resources.
  class CapacityProviderPermissionsConfig
    include JSON::Serializable

    # The ARN of the IAM role that the capacity provider uses to manage compute instances and other
    # Amazon Web Services resources.
    @[JSON::Field(key: "CapacityProviderOperatorRoleArn")]
    property capacity_provider_operator_role_arn : String

    def initialize(
      @capacity_provider_operator_role_arn : String,
    )
    end

    def_equals_and_hash(@capacity_provider_operator_role_arn)
  end
end
