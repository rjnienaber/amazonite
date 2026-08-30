module Amazonite::ApiGatewayV1
  # The DELETE request to delete a usage plan of a given plan Id.
  class DeleteUsagePlanRequest
    include JSON::Serializable

    # The Id of the to-be-deleted usage plan.
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
