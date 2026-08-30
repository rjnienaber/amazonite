private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 256") if value.size > 256
      end

      if value = @target_tracking_scaling_policy_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@policy_name, @target_tracking_scaling_policy_configuration)
  end
end
