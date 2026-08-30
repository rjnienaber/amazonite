private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Configuration for Lambda-managed instances used by the capacity provider.
  class LambdaManagedInstancesCapacityProviderConfig
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the capacity provider.
    @[JSON::Field(key: "CapacityProviderArn")]
    property capacity_provider_arn : String

    # The maximum number of concurrent execution environments that can run on each compute instance.
    @[JSON::Field(key: "PerExecutionEnvironmentMaxConcurrency")]
    property per_execution_environment_max_concurrency : Int32 | Nil

    # The amount of memory in GiB allocated per vCPU for execution environments.
    @[JSON::Field(key: "ExecutionEnvironmentMemoryGiBPerVCpu")]
    property execution_environment_memory_gi_b_per_v_cpu : Float64 | Nil

    def initialize(
      @capacity_provider_arn : String,
      @per_execution_environment_max_concurrency : Int32 | Nil = nil,
      @execution_environment_memory_gi_b_per_v_cpu : Float64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @capacity_provider_arn
        raise Core::ValidationError.new("CapacityProviderArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CapacityProviderArn length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("CapacityProviderArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-zA-Z-]*:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:capacity-provider:[a-zA-Z0-9-_]+$"))
      end

      if value = @per_execution_environment_max_concurrency
        raise Core::ValidationError.new("PerExecutionEnvironmentMaxConcurrency value must be >= 1") if value < 1
        raise Core::ValidationError.new("PerExecutionEnvironmentMaxConcurrency value must be <= 1600") if value > 1600
      end

      if value = @execution_environment_memory_gi_b_per_v_cpu
        raise Core::ValidationError.new("ExecutionEnvironmentMemoryGiBPerVCpu value must be >= 2") if value < 2
        raise Core::ValidationError.new("ExecutionEnvironmentMemoryGiBPerVCpu value must be <= 8") if value > 8
      end
    end

    def_equals_and_hash(@capacity_provider_arn, @per_execution_environment_max_concurrency, @execution_environment_memory_gi_b_per_v_cpu)
  end
end
