module Amazonite::DynamoDBv2
  class AutoScalingPolicyUpdate
    include JSON::Serializable

    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
    property target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationUpdate

    def initialize(
      @target_tracking_scaling_policy_configuration : AutoScalingTargetTrackingScalingPolicyConfigurationUpdate,
      @policy_name : String | Nil = nil
    )
    end
  end
end