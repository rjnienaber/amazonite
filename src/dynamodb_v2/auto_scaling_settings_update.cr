module Amazonite::DynamoDBV2
  # Represents the auto scaling settings to be modified for a global table or global secondary
  # index.
  class AutoScalingSettingsUpdate
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

    # Role ARN used for configuring auto scaling policy.
    @[JSON::Field(key: "AutoScalingRoleArn")]
    property auto_scaling_role_arn : String | Nil

    # The scaling policy to apply for scaling target global table or global secondary index capacity
    # units.
    @[JSON::Field(key: "ScalingPolicyUpdate")]
    property scaling_policy_update : AutoScalingPolicyUpdate | Nil

    def initialize(
      @minimum_units : Int64 | Nil = nil,
      @maximum_units : Int64 | Nil = nil,
      @auto_scaling_disabled : Bool | Nil = nil,
      @auto_scaling_role_arn : String | Nil = nil,
      @scaling_policy_update : AutoScalingPolicyUpdate | Nil = nil,
    )
    end

    def_equals_and_hash(@minimum_units, @maximum_units, @auto_scaling_disabled, @auto_scaling_role_arn, @scaling_policy_update)
  end
end
