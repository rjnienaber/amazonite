module Amazonite::DynamoDBV2
  # Represents the auto scaling settings for a global table or global secondary index.
  class AutoScalingSettingsDescription
    include JSON::Serializable

    # The minimum capacity units that a global table or global secondary index should be scaled down
    # to.
    @[JSON::Field(key: "MinimumUnits")]
    property minimum_units : Int64 | Nil

    # The maximum capacity units that a global table or global secondary index should be scaled up to.
    @[JSON::Field(key: "MaximumUnits")]
    property maximum_units : Int64 | Nil

    # Disabled auto scaling for this global table or global secondary index.
    @[JSON::Field(key: "AutoScalingDisabled")]
    property auto_scaling_disabled : Bool | Nil

    # Role ARN used for configuring the auto scaling policy.
    @[JSON::Field(key: "AutoScalingRoleArn")]
    property auto_scaling_role_arn : String | Nil

    # Information about the scaling policies.
    @[JSON::Field(key: "ScalingPolicies")]
    property scaling_policies : Array(AutoScalingPolicyDescription) | Nil

    def initialize(
      @minimum_units : Int64 | Nil = nil,
      @maximum_units : Int64 | Nil = nil,
      @auto_scaling_disabled : Bool | Nil = nil,
      @auto_scaling_role_arn : String | Nil = nil,
      @scaling_policies : Array(AutoScalingPolicyDescription) | Nil = nil,
    )
    end
  end
end
