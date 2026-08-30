module Amazonite::ApiGatewayV1
  # The GET request to get all the usage plan keys representing the API keys added to a specified
  # usage plan.
  class GetUsagePlanKeysRequest
    include JSON::Serializable

    # The Id of the UsagePlan resource representing the usage plan containing the to-be-retrieved
    # UsagePlanKey resource representing a plan customer.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    # A query parameter specifying the name of the to-be-returned usage plan keys.
    @[JSON::Field(key: "nameQuery", ignore: true)]
    property name_query : String | Nil

    def initialize(
      @usage_plan_id : String,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @name_query : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@usage_plan_id, @position, @limit, @name_query)
  end
end
