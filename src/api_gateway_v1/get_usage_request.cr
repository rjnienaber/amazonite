module Amazonite::ApiGatewayV1
  # The GET request to get the usage data of a usage plan in a specified time interval.
  class GetUsageRequest
    include JSON::Serializable

    # The Id of the usage plan associated with the usage data.
    @[JSON::Field(key: "usagePlanId", ignore: true)]
    property usage_plan_id : String = ""

    # The Id of the API key associated with the resultant usage data.
    @[JSON::Field(key: "keyId", ignore: true)]
    property key_id : String | Nil

    # The starting date (e.g., 2016-01-01) of the usage data.
    @[JSON::Field(key: "startDate", ignore: true)]
    property start_date : String = ""

    # The ending date (e.g., 2016-12-31) of the usage data.
    @[JSON::Field(key: "endDate", ignore: true)]
    property end_date : String = ""

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    def initialize(
      @usage_plan_id : String,
      @start_date : String,
      @end_date : String,
      @key_id : String | Nil = nil,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@usage_plan_id, @key_id, @start_date, @end_date, @position, @limit)
  end
end
