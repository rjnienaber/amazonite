private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetProvisionedConcurrencyConfigResponse
    include JSON::Serializable

    # The amount of provisioned concurrency requested.
    @[JSON::Field(key: "RequestedProvisionedConcurrentExecutions")]
    property requested_provisioned_concurrent_executions : Int32 | Nil

    # The amount of provisioned concurrency available.
    @[JSON::Field(key: "AvailableProvisionedConcurrentExecutions")]
    property available_provisioned_concurrent_executions : Int32 | Nil

    # The amount of provisioned concurrency allocated. When a weighted alias is used during linear and
    # canary deployments, this value fluctuates depending on the amount of concurrency that is
    # provisioned for the function versions.
    @[JSON::Field(key: "AllocatedProvisionedConcurrentExecutions")]
    property allocated_provisioned_concurrent_executions : Int32 | Nil

    # The status of the allocation process.
    @[JSON::Field(key: "Status", converter: AL::ProvisionedConcurrencyStatusEnum)]
    property status : ProvisionedConcurrencyStatusEnum | Nil

    # For failed allocations, the reason that provisioned concurrency could not be allocated.
    @[JSON::Field(key: "StatusReason")]
    property status_reason : String | Nil

    # The date and time that a user last updated the configuration, in [ISO 8601
    # format](https://www.iso.org/iso-8601-date-and-time-format.html).
    @[JSON::Field(key: "LastModified")]
    property last_modified : String | Nil

    def initialize(
      @requested_provisioned_concurrent_executions : Int32 | Nil = nil,
      @available_provisioned_concurrent_executions : Int32 | Nil = nil,
      @allocated_provisioned_concurrent_executions : Int32 | Nil = nil,
      @status : ProvisionedConcurrencyStatusEnum | Nil = nil,
      @status_reason : String | Nil = nil,
      @last_modified : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @requested_provisioned_concurrent_executions
        raise Core::ValidationError.new("RequestedProvisionedConcurrentExecutions value must be >= 1") if value < 1
      end

      if value = @available_provisioned_concurrent_executions
        raise Core::ValidationError.new("AvailableProvisionedConcurrentExecutions value must be >= 0") if value < 0
      end

      if value = @allocated_provisioned_concurrent_executions
        raise Core::ValidationError.new("AllocatedProvisionedConcurrentExecutions value must be >= 0") if value < 0
      end

      if value = @last_modified
        raise Core::ValidationError.new("LastModified length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("LastModified length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("LastModified does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end
    end

    def_equals_and_hash(@requested_provisioned_concurrent_executions, @available_provisioned_concurrent_executions, @allocated_provisioned_concurrent_executions, @status, @status_reason, @last_modified)
  end
end
