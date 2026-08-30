private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @minimum_units
        raise Core::ValidationError.new("MinimumUnits value must be >= 1") if value < 1
      end

      if value = @maximum_units
        raise Core::ValidationError.new("MaximumUnits value must be >= 1") if value < 1
      end

      if value = @auto_scaling_role_arn
        raise Core::ValidationError.new("AutoScalingRoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AutoScalingRoleArn length must be <= 1600") if value.size > 1600
      end

      if value = @scaling_policy_update
        value.validate!
      end
    end

    def_equals_and_hash(@minimum_units, @maximum_units, @auto_scaling_disabled, @auto_scaling_role_arn, @scaling_policy_update)
  end
end
