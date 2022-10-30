module Amazonite::DynamoDBV2
  class AutoScalingPolicyDescription
    include JSON::Serializable

    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
    property target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationDescription | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationDescription | Nil = nil
    )
    end
  end
end
