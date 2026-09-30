private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @capacity_provider_operator_role_arn
        raise Core::ValidationError.new("CapacityProviderOperatorRoleArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CapacityProviderOperatorRoleArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("CapacityProviderOperatorRoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:iam::\\d{12}:role/?[a-zA-Z_0-9+=,.@\\-_/]+$"))
      end
    end

    def_equals_and_hash(@capacity_provider_operator_role_arn)
  end
end
