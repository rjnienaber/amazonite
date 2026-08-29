private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutProvisionedConcurrencyConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "RequestedProvisionedConcurrentExecutions")]
    property requested_provisioned_concurrent_executions : Int32 | Nil

    @[JSON::Field(key: "AllocatedProvisionedConcurrentExecutions")]
    property allocated_provisioned_concurrent_executions : Int32 | Nil

    @[JSON::Field(key: "AvailableProvisionedConcurrentExecutions")]
    property available_provisioned_concurrent_executions : Int32 | Nil

    @[JSON::Field(key: "Status", converter: AL::ProvisionedConcurrencyStatusEnum)]
    property status : ProvisionedConcurrencyStatusEnum | Nil

    @[JSON::Field(key: "StatusReason")]
    property status_reason : String | Nil

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
  end
end
