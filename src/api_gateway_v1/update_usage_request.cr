private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # The PATCH request to grant a temporary extension to the remaining quota of a usage plan
  # associated with a specified API key.
  class UpdateUsageRequest
    include JSON::Serializable

    # The Id of the usage plan associated with the usage data.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # The identifier of the API key associated with the usage plan in which a temporary extension is
    # granted to the remaining quota.
    @[JSON::Field(key: "keyId", ignore: true)]
    property key_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @usage_plan_id : String,
      @key_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@usage_plan_id, @key_id, @patch_operations)
  end
end
