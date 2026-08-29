private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class CapacityProviderScalingConfig
    include JSON::Serializable

    @[JSON::Field(key: "MaxVCpuCount")]
    property max_v_cpu_count : Int32 | Nil

    @[JSON::Field(key: "ScalingMode", converter: AL::CapacityProviderScalingMode)]
    property scaling_mode : CapacityProviderScalingMode | Nil

    @[JSON::Field(key: "ScalingPolicies")]
    property scaling_policies : Array(TargetTrackingScalingPolicy) | Nil

    def initialize(
      @max_v_cpu_count : Int32 | Nil = nil,
      @scaling_mode : CapacityProviderScalingMode | Nil = nil,
      @scaling_policies : Array(TargetTrackingScalingPolicy) | Nil = nil,
    )
    end
  end
end
