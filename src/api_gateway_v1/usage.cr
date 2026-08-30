module Amazonite::ApiGatewayV1
  # Represents the usage data of a usage plan.
  class Usage
    include JSON::Serializable

    # The plan Id associated with this usage data.
    @[JSON::Field(key: "usagePlanId")]
    property usage_plan_id : String | Nil

    # The starting date of the usage data.
    @[JSON::Field(key: "startDate")]
    property start_date : String | Nil

    # The ending date of the usage data.
    @[JSON::Field(key: "endDate")]
    property end_date : String | Nil

    # The usage data, as daily logs of used and remaining quotas, over the specified time interval
    # indexed over the API keys in a usage plan. For example, `{..., "values" : { "{api_key}" : [ [0,
    # 100], [10, 90], [100, 10]]}`, where `{api_key}` stands for an API key value and the daily log
    # entry is of the format `[used quota, remaining quota]`.
    @[JSON::Field(key: "values")]
    property items : Hash(String, Array(Array(Int64))) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @usage_plan_id : String | Nil = nil,
      @start_date : String | Nil = nil,
      @end_date : String | Nil = nil,
      @items : Hash(String, Array(Array(Int64))) | Nil = nil,
      @position : String | Nil = nil,
    )
    end
  end
end
