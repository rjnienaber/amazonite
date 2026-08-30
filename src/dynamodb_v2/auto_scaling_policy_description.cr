module Amazonite::DynamoDBV2
  # Represents the properties of the scaling policy.
  class AutoScalingPolicyDescription
    include JSON::Serializable

    # The name of the scaling policy.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    # Represents a target tracking scaling policy configuration.
    @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
    property target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationDescription | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationDescription | Nil = nil,
    )
    end
  end
end
