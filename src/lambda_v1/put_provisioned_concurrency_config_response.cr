private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutProvisionedConcurrencyConfigResponse
    include JSON::Serializable

    # The amount of provisioned concurrency requested.
    @[JSON::Field(key: "RequestedProvisionedConcurrentExecutions")]
    property requested_provisioned_concurrent_executions : Int32 | Nil

    # The amount of provisioned concurrency allocated. When a weighted alias is used during linear and
    # canary deployments, this value fluctuates depending on the amount of concurrency that is
    # provisioned for the function versions.
    @[JSON::Field(key: "AllocatedProvisionedConcurrentExecutions")]
    property allocated_provisioned_concurrent_executions : Int32 | Nil

    # The amount of provisioned concurrency available.
    @[JSON::Field(key: "AvailableProvisionedConcurrentExecutions")]
    property available_provisioned_concurrent_executions : Int32 | Nil

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
      @allocated_provisioned_concurrent_executions : Int32 | Nil = nil,
      @available_provisioned_concurrent_executions : Int32 | Nil = nil,
      @status : ProvisionedConcurrencyStatusEnum | Nil = nil,
      @status_reason : String | Nil = nil,
      @last_modified : String | Nil = nil,
    )
    end

    def_equals_and_hash(@requested_provisioned_concurrent_executions, @allocated_provisioned_concurrent_executions, @available_provisioned_concurrent_executions, @status, @status_reason, @last_modified)
  end
end
