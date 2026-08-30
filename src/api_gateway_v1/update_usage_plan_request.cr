private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # The PATCH request to update a usage plan of a given plan Id.
  class UpdateUsagePlanRequest
    include JSON::Serializable

    # The Id of the to-be-updated usage plan.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @usage_plan_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@usage_plan_id, @patch_operations)
  end
end
