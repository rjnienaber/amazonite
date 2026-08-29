module Amazonite::LambdaV1
  class ChainedInvokeOptions
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    @[JSON::Field(key: "TenantId")]
    property tenant_id : String | Nil

    def initialize(
      @function_name : String,
      @tenant_id : String | Nil = nil,
    )
    end
  end
end
