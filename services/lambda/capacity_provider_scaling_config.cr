private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @max_v_cpu_count
        raise Core::ValidationError.new("MaxVCpuCount value must be >= 2") if value < 2
        raise Core::ValidationError.new("MaxVCpuCount value must be <= 15000") if value > 15000
      end

      if value = @scaling_policies
        raise Core::ValidationError.new("ScalingPolicies must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ScalingPolicies must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@max_v_cpu_count, @scaling_mode, @scaling_policies)
  end
end
