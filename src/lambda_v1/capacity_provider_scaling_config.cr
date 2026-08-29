private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Configuration that defines how the capacity provider scales compute instances based on demand
  # and policies.
  class CapacityProviderScalingConfig
    include JSON::Serializable

    # The maximum number of vCPUs that the capacity provider can provision across all compute
    # instances.
    @[JSON::Field(key: "MaxVCpuCount")]
    property max_v_cpu_count : Int32 | Nil

    # The scaling mode that determines how the capacity provider responds to changes in demand.
    @[JSON::Field(key: "ScalingMode", converter: AL::CapacityProviderScalingMode)]
    property scaling_mode : CapacityProviderScalingMode | Nil

    # A list of scaling policies that define how the capacity provider scales compute instances based
    # on metrics and thresholds.
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
