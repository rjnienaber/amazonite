module Amazonite::ApiGatewayV1
  # The DELETE request to delete a usage plan key and remove the underlying API key from the
  # associated usage plan.
  class DeleteUsagePlanKeyRequest
    include JSON::Serializable

    # The Id of the UsagePlan resource representing the usage plan containing the to-be-deleted
    # UsagePlanKey resource representing a plan customer.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # The Id of the UsagePlanKey resource to be deleted.
    @[JSON::Field(key: "keyId", ignore: true)]
    property key_id : String = ""

    def initialize(
      @usage_plan_id : String,
      @key_id : String,
    )
    end

    def_equals_and_hash(@usage_plan_id, @key_id)
  end
end
