module Amazonite::CloudWatchV1
  class GetDashboardOutput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardArn")]
    property dashboard_arn : String | Nil

    @[JSON::Field(key: "DashboardBody")]
    property dashboard_body : String | Nil

    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String | Nil

    def initialize(
      @dashboard_arn : String | Nil = nil,
      @dashboard_body : String | Nil = nil,
      @dashboard_name : String | Nil = nil,
    )
    end
  end
end
