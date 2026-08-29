module Amazonite::DynamoDBV2
  # Represents the auto scaling policy to be modified.
  class AutoScalingPolicyUpdate
    include JSON::Serializable

    # The name of the scaling policy.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    # Represents a target tracking scaling policy configuration.
    @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
    property target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationUpdate

    def initialize(
      @target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationUpdate,
      @policy_name : String | Nil = nil,
    )
    end
  end
end
