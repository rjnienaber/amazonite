module Amazonite::ApiGateway
  # The POST request to create a usage plan key for adding an existing API key to a usage plan.
  class CreateUsagePlanKeyRequest
    include JSON::Serializable

    # The Id of the UsagePlan resource representing the usage plan containing the to-be-created
    # UsagePlanKey resource representing a plan customer.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # The identifier of a UsagePlanKey resource for a plan customer.
    @[JSON::Field(key: "keyId")]
    property key_id : String

    # The type of a UsagePlanKey resource for a plan customer.
    @[JSON::Field(key: "keyType")]
    property key_type : String

    def initialize(
      @usage_plan_id : String,
      @key_id : String,
      @key_type : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@usage_plan_id, @key_id, @key_type)
  end
end
