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

    def_equals_and_hash(@capacity_provider_arn, @per_execution_environment_max_concurrency, @execution_environment_memory_gi_b_per_v_cpu)
  end
end
