module Amazonite::ApiGateway
  # The GET request to get a usage plan key of a given key identifier.
  class GetUsagePlanKeyRequest
    include JSON::Serializable

    # The Id of the UsagePlan resource representing the usage plan containing the to-be-retrieved
    # UsagePlanKey resource representing a plan customer.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # The key Id of the to-be-retrieved UsagePlanKey resource representing a plan customer.
    @[JSON::Field(key: "keyId", ignore: true)]
    property key_id : String = ""

    def initialize(
      @usage_plan_id : String,
      @key_id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@usage_plan_id, @key_id)
  end
end
