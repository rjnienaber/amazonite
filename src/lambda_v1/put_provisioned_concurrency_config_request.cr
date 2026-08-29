module Amazonite::LambdaV1
  class PutProvisionedConcurrencyConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    @[JSON::Field(key: "ProvisionedConcurrentExecutions")]
    property provisioned_concurrent_executions : Int32

    def initialize(
      @function_name : String,
      @qualifier : String,
      @provisioned_concurrent_executions : Int32,
    )
    end
  end
end
