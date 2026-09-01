module Amazonite::ApiGateway
  # The GET request to get a usage plan of a given plan identifier.
  class GetUsagePlanRequest
    include JSON::Serializable

    # The identifier of the UsagePlan resource to be retrieved.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    def initialize(
      @usage_plan_id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@usage_plan_id)
  end
end
