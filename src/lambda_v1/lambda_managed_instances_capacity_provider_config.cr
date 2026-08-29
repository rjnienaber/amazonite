module Amazonite::LambdaV1
  class LambdaManagedInstancesCapacityProviderConfig
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviderArn")]
    property capacity_provider_arn : String

    @[JSON::Field(key: "PerExecutionEnvironmentMaxConcurrency")]
    property per_execution_environment_max_concurrency : Int32 | Nil

    @[JSON::Field(key: "ExecutionEnvironmentMemoryGiBPerVCpu")]
    property execution_environment_memory_gi_b_per_v_cpu : Float64 | Nil

    def initialize(
      @capacity_provider_arn : String,
      @per_execution_environment_max_concurrency : Int32 | Nil = nil,
      @execution_environment_memory_gi_b_per_v_cpu : Float64 | Nil = nil,
    )
    end
  end
end
