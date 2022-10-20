module Amazonite::DynamoDBv2
  class AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
    include JSON::Serializable

    @[JSON::Field(key: "DisableScaleIn")]
    property disable_scale_in : Bool | Nil

    @[JSON::Field(key: "ScaleInCooldown")]
    property scale_in_cooldown : Int32 | Nil

    @[JSON::Field(key: "ScaleOutCooldown")]
    property scale_out_cooldown : Int32 | Nil

    @[JSON::Field(key: "TargetValue")]
    property target_value : Float64

    def initialize(
      @target_value : Float64,
      @disable_scale_in : Bool | Nil = nil,
      @scale_in_cooldown : Int32 | Nil = nil,
      @scale_out_cooldown : Int32 | Nil = nil
    )
    end
  end
end
